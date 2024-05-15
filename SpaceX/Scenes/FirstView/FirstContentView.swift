//
//  FirstContentView.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 15.05.2024.
//

import UIKit

class FirstContentView: UIView {
    
    
    //MARK: - UI Elements -
    
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
    
    let buttonSettings: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(.setting, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        button.tintColor = UIColor.white
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let scrollViewParameterInfo: UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.backgroundColor = UIColor.black
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let firstLaunchTitle: UILabel = {
        let label = UILabel()
        label.text = "First launch"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstLaunchValue: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryTitle: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countryValue: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let launchCostTitle: UILabel = {
        let label = UILabel()
        label.text = "Launch cost"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let launchCostValue: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstStageTitle: UILabel = {
        let label = UILabel()
        label.text = "FIRST STAGE"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfEnginesTitle: UILabel = {
        let label = UILabel()
        label.text = "Number of engines"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfEnginesValue: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountOfFuelInTonsTitle: UILabel = {
        let label = UILabel()
        label.text = "Amount of fuel in tons"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountOfFuelInTonsValue: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let burnTimeTitle: UILabel = {
        let label = UILabel()
        label.text = "Burn time in sec"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let burnTimeValue: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let secondStageTitle: UILabel = {
        let label = UILabel()
        label.text = "SECOND STAGE"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfEnginesTitleSecond: UILabel = {
        let label = UILabel()
        label.text = "Number of engines"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfEnginesValueSecond: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountOfFuelInTonsTitleSecond: UILabel = {
        let label = UILabel()
        label.text = "Amount of fuel in tons"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountOfFuelInTonsValueSecond: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let burnTimeTitleSecond: UILabel = {
        let label = UILabel()
        label.text = "Burn time in sec"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let burnTimeValueSecond: UILabel = {
        let label = UILabel()
        label.text = "No data"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonToRocketLaunchView: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View launchers", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGreyColorBackground
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = UIColor.darkGreyColorBackground
        pageControl.layer.cornerRadius = 10
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    
    //MARK: - Intents -
    
    func setupLayout() {
        self.addSubview(mainScrollView)
        mainScrollView.addSubview(mainContentView)
        
        mainContentView.addSubview(scrollViewRocketImage)
        mainContentView.addSubview(backgroundInfo)
        self.addSubview(pageControl)
        backgroundInfo.addSubview(titleLabel)
        backgroundInfo.addSubview(buttonSettings)
        backgroundInfo.addSubview(scrollViewParameterInfo)
        
        backgroundInfo.addSubview(firstLaunchTitle)
        backgroundInfo.addSubview(firstLaunchValue)
        backgroundInfo.addSubview(countryTitle)
        backgroundInfo.addSubview(countryValue)
        backgroundInfo.addSubview(launchCostTitle)
        backgroundInfo.addSubview(launchCostValue)
        backgroundInfo.addSubview(firstStageTitle)
        backgroundInfo.addSubview(numberOfEnginesTitle)
        backgroundInfo.addSubview(numberOfEnginesValue)
        backgroundInfo.addSubview(amountOfFuelInTonsTitle)
        backgroundInfo.addSubview(amountOfFuelInTonsValue)
        backgroundInfo.addSubview(burnTimeTitle)
        backgroundInfo.addSubview(burnTimeValue)
        
        backgroundInfo.addSubview(secondStageTitle)
        backgroundInfo.addSubview(numberOfEnginesTitleSecond)
        backgroundInfo.addSubview(numberOfEnginesValueSecond)
        backgroundInfo.addSubview(amountOfFuelInTonsTitleSecond)
        backgroundInfo.addSubview(amountOfFuelInTonsValueSecond)
        backgroundInfo.addSubview(burnTimeTitleSecond)
        backgroundInfo.addSubview(burnTimeValueSecond)
        backgroundInfo.addSubview(buttonToRocketLaunchView)
        
        NSLayoutConstraint.activate([
            mainScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            mainContentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainContentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            
            mainContentView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor, constant: 80),
            mainContentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            
            scrollViewRocketImage.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            scrollViewRocketImage.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            scrollViewRocketImage.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: -70),
            scrollViewRocketImage.heightAnchor.constraint(equalToConstant: 300),
            
            backgroundInfo.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 200),
            backgroundInfo.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor, constant: 0),
            backgroundInfo.leftAnchor.constraint(equalTo: mainContentView.leftAnchor, constant: 0),
            backgroundInfo.rightAnchor.constraint(equalTo: mainContentView.rightAnchor, constant: -0),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundInfo.topAnchor, constant: 40),
            titleLabel.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            buttonSettings.topAnchor.constraint(equalTo: backgroundInfo.topAnchor, constant: 40),
            buttonSettings.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            
            scrollViewParameterInfo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            scrollViewParameterInfo.trailingAnchor.constraint(equalTo: backgroundInfo.trailingAnchor),
            scrollViewParameterInfo.leadingAnchor.constraint(equalTo: backgroundInfo.leadingAnchor),
            scrollViewParameterInfo.heightAnchor.constraint(equalToConstant: 110),
            
            firstLaunchTitle.topAnchor.constraint(equalTo: scrollViewParameterInfo.bottomAnchor, constant: 30),
            firstLaunchTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            firstLaunchValue.topAnchor.constraint(equalTo: scrollViewParameterInfo.bottomAnchor, constant: 30),
            firstLaunchValue.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            countryTitle.topAnchor.constraint(equalTo: firstLaunchTitle.bottomAnchor, constant: 16),
            countryTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            countryValue.topAnchor.constraint(equalTo: firstLaunchValue.bottomAnchor, constant: 16),
            countryValue.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            launchCostTitle.topAnchor.constraint(equalTo: countryTitle.bottomAnchor, constant: 16),
            launchCostTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            launchCostValue.topAnchor.constraint(equalTo: countryValue.bottomAnchor, constant: 16),
            launchCostValue.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            firstStageTitle.topAnchor.constraint(equalTo: launchCostTitle.bottomAnchor, constant: 30),
            firstStageTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            numberOfEnginesTitle.topAnchor.constraint(equalTo: firstStageTitle.bottomAnchor, constant: 16),
            numberOfEnginesTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            numberOfEnginesValue.topAnchor.constraint(equalTo: firstStageTitle.bottomAnchor, constant: 16),
            numberOfEnginesValue.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            amountOfFuelInTonsTitle.topAnchor.constraint(equalTo: numberOfEnginesTitle.bottomAnchor, constant: 16),
            amountOfFuelInTonsTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            amountOfFuelInTonsValue.topAnchor.constraint(equalTo: numberOfEnginesValue.bottomAnchor, constant: 16),
            amountOfFuelInTonsValue.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            burnTimeTitle.topAnchor.constraint(equalTo: amountOfFuelInTonsTitle.bottomAnchor, constant: 16),
            burnTimeTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            burnTimeValue.topAnchor.constraint(equalTo: amountOfFuelInTonsValue.bottomAnchor, constant: 16),
            burnTimeValue.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            secondStageTitle.topAnchor.constraint(equalTo: burnTimeTitle.bottomAnchor, constant: 30),
            secondStageTitle.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            numberOfEnginesTitleSecond.topAnchor.constraint(equalTo: secondStageTitle.bottomAnchor, constant: 16),
            numberOfEnginesTitleSecond.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            numberOfEnginesValueSecond.topAnchor.constraint(equalTo: secondStageTitle.bottomAnchor, constant: 16),
            numberOfEnginesValueSecond.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            amountOfFuelInTonsTitleSecond.topAnchor.constraint(equalTo: numberOfEnginesTitleSecond.bottomAnchor, constant: 16),
            amountOfFuelInTonsTitleSecond.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            amountOfFuelInTonsValueSecond.topAnchor.constraint(equalTo: numberOfEnginesValueSecond.bottomAnchor, constant: 16),
            amountOfFuelInTonsValueSecond.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            burnTimeTitleSecond.topAnchor.constraint(equalTo: amountOfFuelInTonsTitleSecond.bottomAnchor, constant: 16),
            burnTimeTitleSecond.leftAnchor.constraint(equalTo: backgroundInfo.leftAnchor, constant: 28),
            
            burnTimeValueSecond.topAnchor.constraint(equalTo: amountOfFuelInTonsValueSecond.bottomAnchor, constant: 16),
            burnTimeValueSecond.rightAnchor.constraint(equalTo: backgroundInfo.rightAnchor, constant: -28),
            
            buttonToRocketLaunchView.topAnchor.constraint(equalTo: burnTimeValueSecond.bottomAnchor, constant: 30),
            buttonToRocketLaunchView.bottomAnchor.constraint(equalTo: backgroundInfo.bottomAnchor, constant: -40),
            buttonToRocketLaunchView.leadingAnchor.constraint(equalTo: backgroundInfo.leadingAnchor, constant: 28),
            buttonToRocketLaunchView.trailingAnchor.constraint(equalTo: backgroundInfo.trailingAnchor, constant: -28),
            buttonToRocketLaunchView.heightAnchor.constraint(equalToConstant: 50),
            
            pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        
        scrollViewRocketImage.isScrollEnabled = false
        scrollViewParameterInfo.contentInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
        scrollViewParameterInfo.contentInsetAdjustmentBehavior = .never
        scrollViewParameterInfo.showsHorizontalScrollIndicator = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
