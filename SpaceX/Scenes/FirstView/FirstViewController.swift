//
//  FirstViewController.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import UIKit

class FirstViewController: UIViewController, ThirdViewControllerDelegate {
    
    //MARK: - Properties -
    var firstViewModel: FirstViewModel?
    private let contentView = FirstContentView()

    
    //MARK: - Life cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        contentView.mainScrollView.delegate = self
        contentView.scrollViewRocketImage.delegate = self
        contentView.scrollViewParameterInfo.delegate = self
        contentView.scrollViewParameterInfo.dataSource = self
        contentView.scrollViewParameterInfo.register(ParameterInfoCell.self, forCellWithReuseIdentifier: "ParameterInfoCell")

        setupNotificationObserver()
        
        firstViewModel = FirstViewModel(contentView: contentView)
        firstViewModel?.fetchRocketInfo()
        
        
        contentView.buttonSettings.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        contentView.buttonToRocketLaunchView.addTarget(self, action: #selector(rocketLaunchButtonTapped), for: .touchUpInside)
        contentView.pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    //MARK: - intents -

    func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(_:)), name: .updateUI, object: firstViewModel)
    }
    
    @objc func updateUI(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let rocket = userInfo["rocket"] as? RocketInfo else {
            return
        }
        
        contentView.titleLabel.text = rocket.name
        contentView.firstLaunchValue.text = rocket.firstFlight
        contentView.countryValue.text = rocket.country
        contentView.launchCostValue.text = "$\(rocket.costPerLaunch)"
        contentView.numberOfEnginesValue.text = "\(rocket.firstStage.engines)"
        contentView.amountOfFuelInTonsValue.text = "\(rocket.firstStage.fuelAmountTons) ton"
        contentView.burnTimeValue.text = "\(rocket.firstStage.burnTimeSEC ?? 0) sec"
        contentView.numberOfEnginesValueSecond.text = "\(rocket.secondStage.engines)"
        contentView.amountOfFuelInTonsValueSecond.text = "\(rocket.secondStage.fuelAmountTons) ton"
        contentView.burnTimeValueSecond.text = "\(rocket.secondStage.burnTimeSEC ?? 0) sec"
        
        if let viewModel = firstViewModel {
            contentView.pageControl.numberOfPages = viewModel.rocketInfo.count
            firstViewModel?.updateImageViews(with: rocket.flickrImages)
        }
        updateParameterInfoCells()
    }
    
    @objc func pageControlValueChanged(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        contentView.scrollViewRocketImage.setContentOffset(CGPoint(x: CGFloat(currentPage) * contentView.scrollViewRocketImage.frame.width, y: 0), animated: true)
        
        if let viewModel = firstViewModel {
            viewModel.currentRocketIndex = currentPage
            viewModel.updateUI()
        }
    }
    
    @objc func rocketLaunchButtonTapped() {
        if let rocketName = contentView.titleLabel.text, let rocket = firstViewModel?.rocketInfo.first(where: { $0.name == rocketName }) {
            navigationController?.navigationBar.tintColor = .white
            let secondVC = SecondViewController()
            secondVC.rocketName = rocketName
            secondVC.rocketId = rocket.id
            navigationController?.pushViewController(secondVC, animated: false)
        }
    }
    
    @objc func settingsButtonTapped() {
        let settingsVC = ThirdViewController()
        settingsVC.delegate = self
        present(settingsVC, animated: true)
    }
    
    func didUpdateUnits() {
        updateParameterInfoCells()
    }
    
    func updateParameterInfoCells() {
        let selectedHeightUnit = UserDefaults.standard.string(forKey: "selectedHeightUnit") ?? "m"
        let selectedDiameterUnit = UserDefaults.standard.string(forKey: "selectedDiameterUnit") ?? "m"
        let selectedMassUnit = UserDefaults.standard.string(forKey: "selectedMassUnit") ?? "kg"
        let selectedPayloadUnit = UserDefaults.standard.string(forKey: "selectedPayloadUnit") ?? "kg"
        
        for (index, cell) in contentView.scrollViewParameterInfo.visibleCells.enumerated() {
            if let parameterInfoCell = cell as? ParameterInfoCell {
                switch index {
                case 0:
                    parameterInfoCell.configure(with: "height", unit: selectedHeightUnit)
                case 1:
                    parameterInfoCell.configure(with: "diameter", unit: selectedDiameterUnit)
                case 2:
                    parameterInfoCell.configure(with: "mass", unit: selectedMassUnit)
                case 3:
                    parameterInfoCell.configure(with: "payload", unit: selectedPayloadUnit)
                default:
                    break
                }
                parameterInfoCell.rocket = firstViewModel?.rocketInfo[firstViewModel?.currentRocketIndex ?? 0]
            }
        }
    }
    
}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParameterInfoCell", for: indexPath) as! ParameterInfoCell
        cell.layer.cornerRadius = 25
        cell.backgroundColor = UIColor.darkGreyColorBackground
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 100)
        }
}
