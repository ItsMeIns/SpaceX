//
//  FirstViewController.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: - Properties -
    var firstViewModel: FirstViewModel?
    private let contentView = FirstContentView()
    
    
    
//    //MARK: - Content -

    
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
        
        contentView.buttonSettings.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        contentView.buttonToRocketLaunchView.addTarget(self, action: #selector(rocketLaunchButtonTapped), for: .touchUpInside)
        contentView.pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
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
        updateParameterInfoCells(with: rocket)
        
    }
    
    func updateParameterInfoCells(with rocket: RocketInfo) {
        for (index, cell) in contentView.scrollViewParameterInfo.visibleCells.enumerated() {
            if let parameterInfoCell = cell as? ParameterInfoCell {
                switch index {
                case 0:
                    parameterInfoCell.configure(with: "height", unit: UserDefaults.standard.string(forKey: "selectedHeightUnit") ?? "m")
                case 1:
                    parameterInfoCell.configure(with: "diameter", unit: UserDefaults.standard.string(forKey: "selectedDiameterUnit") ?? "m")
                case 2:
                    parameterInfoCell.configure(with: "mass", unit: UserDefaults.standard.string(forKey: "selectedMassUnit") ?? "kg")
                case 3:
                    parameterInfoCell.configure(with: "payload", unit: UserDefaults.standard.string(forKey: "selectedPayloadUnit") ?? "kg")
                default:
                    break
                }
                parameterInfoCell.rocket = rocket
            }
        }
    }
    
//    func updateImageViews(with imageNames: [String]) {
//        let screenWidth = UIScreen.main.bounds.width
//        let screenHeight = contentView.scrollViewRocketImage.bounds.height
//        contentView.scrollViewRocketImage.contentSize = CGSize(width: screenWidth * CGFloat(imageNames.count), height: screenHeight)
//        
//        for (index, imageName) in imageNames.enumerated() {
//            let imageView = UIImageView(frame: CGRect(x: screenWidth * CGFloat(index), y: 0, width: screenWidth, height: screenHeight))
//            imageView.contentMode = .scaleAspectFill
//            imageView.clipsToBounds = true
//            
//            let randomIndex = Int.random(in: 0..<imageNames.count)
//            let randomImageName = imageNames[randomIndex]
//            
//            if let randomImageURL = URL(string: randomImageName) {
//                loadImageFromURL(randomImageURL) { randomImage in
//                    DispatchQueue.main.async {
//                        imageView.image = randomImage
//                    }
//                }
//            }
//            contentView.scrollViewRocketImage.addSubview(imageView)
//            imageViews.append(imageView)
//        }
//    }
//    
//    func loadImageFromURL(_ url: URL, completion: @escaping (UIImage?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error loading image: \(error.localizedDescription)")
//                completion(nil)
//                return
//            }
//            
//            guard let data = data, let image = UIImage(data: data) else {
//                completion(nil)
//                return
//            }
//            completion(image)
//        }.resume()
//    }
    
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
        present(settingsVC, animated: true)
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
