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
    var imageViews: [UIImageView] = []
    
    
    //MARK: - Content -
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let mainContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollViewRocketImage: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let backgroundInfo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollViewParameterInfo: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.backgroundColor = UIColor.black
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        return pageControl
    }()
    
    
    //MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        mainScrollView.delegate = self
        scrollViewRocketImage.delegate = self
        scrollViewParameterInfo.delegate = self
        scrollViewParameterInfo.dataSource = self
        scrollViewParameterInfo.register(ParameterInfoCell.self, forCellWithReuseIdentifier: "ParameterInfoCell")
        
        setupLayout()
        setupNotificationObserver()
        
        firstViewModel = FirstViewModel()
        firstViewModel?.fetchRocketInfo()
    }
    
    
    //MARK: - intents -
    func setupLayout() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainContentView)
        
        mainScrollView.addSubview(scrollViewRocketImage)
        mainScrollView.addSubview(backgroundInfo)
        view.addSubview(pageControl)
        backgroundInfo.addSubview(titleLabel)
        backgroundInfo.addSubview(scrollViewParameterInfo)
        
        NSLayoutConstraint.activate([
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainContentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainContentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            
            mainContentView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor, multiplier: 2),
            mainContentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            
            
            
            scrollViewRocketImage.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            scrollViewRocketImage.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            scrollViewRocketImage.topAnchor.constraint(equalTo: mainContentView.topAnchor),
            scrollViewRocketImage.heightAnchor.constraint(equalToConstant: 300),
            
            backgroundInfo.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 270),
            backgroundInfo.leftAnchor.constraint(equalTo: mainContentView.leftAnchor, constant: 0),
            backgroundInfo.rightAnchor.constraint(equalTo: mainContentView.rightAnchor, constant: -0),
            backgroundInfo.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundInfo.topAnchor, constant: 40),
            titleLabel.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            scrollViewParameterInfo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            scrollViewParameterInfo.trailingAnchor.constraint(equalTo: backgroundInfo.trailingAnchor),
            scrollViewParameterInfo.leadingAnchor.constraint(equalTo: backgroundInfo.leadingAnchor),
            scrollViewParameterInfo.heightAnchor.constraint(equalToConstant: 110),
            
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        scrollViewRocketImage.isScrollEnabled = false
    }
    
    func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(_:)), name: .updateUI, object: firstViewModel)
    }
    
    @objc func updateUI(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let rocket = userInfo["rocket"] as? RocketInfo else {
            return
        }
        
        titleLabel.text = rocket.name
        
        if let viewModel = firstViewModel {
            pageControl.numberOfPages = viewModel.rocketInfo.count
            updateImageViews(with: rocket.flickrImages)
            updateParameterInfoCells(with: rocket)
        }
    }
    
    func updateParameterInfoCells(with rocket: RocketInfo) {
        for (index, cell) in scrollViewParameterInfo.visibleCells.enumerated() {
            if let parameterInfoCell = cell as? ParameterInfoCell {
                switch index {
                case 0:
                    parameterInfoCell.configure(with: "height")
                case 1:
                    parameterInfoCell.configure(with: "diameter")
                case 2:
                    parameterInfoCell.configure(with: "mass")
                case 3:
                    parameterInfoCell.configure(with: "payload")
                default:
                    break
                }
                parameterInfoCell.rocket = rocket
            }
        }
    }
    
    func updateImageViews(with imageNames: [String]) {
        for imageView in imageViews {
            imageView.removeFromSuperview()
        }
        imageViews.removeAll()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = scrollViewRocketImage.bounds.height
        scrollViewRocketImage.contentSize = CGSize(width: screenWidth * CGFloat(imageNames.count), height: screenHeight)
        
        for (index, imageName) in imageNames.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: screenWidth * CGFloat(index), y: 0, width: screenWidth, height: screenHeight))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            
            let randomIndex = Int.random(in: 0..<imageNames.count)
            let randomImageName = imageNames[randomIndex]
            
            if let randomImageURL = URL(string: randomImageName) {
                loadImageFromURL(randomImageURL) { randomImage in
                    DispatchQueue.main.async {
                        imageView.image = randomImage
                    }
                }
            }
            scrollViewRocketImage.addSubview(imageView)
            imageViews.append(imageView)
        }
    }
    
    func loadImageFromURL(_ url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
    
    @objc func pageControlValueChanged(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        scrollViewRocketImage.setContentOffset(CGPoint(x: CGFloat(currentPage) * scrollViewRocketImage.frame.width, y: 0), animated: true)
        
        if let viewModel = firstViewModel {
            viewModel.currentRocketIndex = currentPage
            viewModel.updateUI()
        }
    }
    
}

extension FirstViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
    }
}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParameterInfoCell", for: indexPath) as! ParameterInfoCell
        cell.layer.cornerRadius = 25
        cell.backgroundColor = UIColor.darcGreyColorBackground
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 100, height: 100)
        }
}
