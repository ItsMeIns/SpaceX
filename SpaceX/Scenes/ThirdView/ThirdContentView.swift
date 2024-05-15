//
//  ThirdContentView.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 15.05.2024.
//

import UIKit

class ThirdContentView: UIView {
    
    //MARK: - Properties -
    
    let heightItems = ["m", "ft"]
    let diameterItems = ["m", "ft"]
    let massItems = ["kg", "lb"]
    let payloadItems = ["kg", "lb"]
    
    
    //MARK: - UI Elements -
    let settingLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var heightControl: UISegmentedControl = {
        let control = UISegmentedControl(items: heightItems)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let diameterLabel: UILabel = {
        let label = UILabel()
        label.text = "Diameter"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var diameterControl: UISegmentedControl = {
        let control = UISegmentedControl(items: diameterItems)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let massLabel: UILabel = {
        let label = UILabel()
        label.text = "Mass"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var massControl: UISegmentedControl = {
        let control = UISegmentedControl(items: massItems)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let payloadLabel: UILabel = {
        let label = UILabel()
        label.text = "Payload"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var payloadControl: UISegmentedControl = {
        let control = UISegmentedControl(items: payloadItems)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    //MARK: - Intents -
    
    func setupLayout() {
        self.addSubview(settingLabel)
        self.addSubview(backButton)
        
        self.addSubview(heightLabel)
        self.addSubview(heightControl)
        self.addSubview(diameterLabel)
        self.addSubview(diameterControl)
        self.addSubview(massLabel)
        self.addSubview(massControl)
        self.addSubview(payloadLabel)
        self.addSubview(payloadControl)
        
        NSLayoutConstraint.activate([
            settingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            settingLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            
            backButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            heightLabel.topAnchor.constraint(equalTo: settingLabel.bottomAnchor, constant: 70),
            heightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            heightControl.topAnchor.constraint(equalTo: settingLabel.bottomAnchor, constant: 60),
            heightControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            heightControl.heightAnchor.constraint(equalToConstant: 40),
            heightControl.widthAnchor.constraint(equalToConstant: 120),
            
            diameterLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 45),
            diameterLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            diameterControl.topAnchor.constraint(equalTo: heightControl.bottomAnchor, constant: 35),
            diameterControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            diameterControl.heightAnchor.constraint(equalToConstant: 40),
            diameterControl.widthAnchor.constraint(equalToConstant: 120),
            
            massLabel.topAnchor.constraint(equalTo: diameterLabel.bottomAnchor, constant: 45),
            massLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            massControl.topAnchor.constraint(equalTo: diameterControl.bottomAnchor, constant: 35),
            massControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            massControl.heightAnchor.constraint(equalToConstant: 40),
            massControl.widthAnchor.constraint(equalToConstant: 120),
            
            payloadLabel.topAnchor.constraint(equalTo: massLabel.bottomAnchor, constant: 45),
            payloadLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            payloadControl.topAnchor.constraint(equalTo: massControl.bottomAnchor, constant: 35),
            payloadControl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            payloadControl.heightAnchor.constraint(equalToConstant: 40),
            payloadControl.widthAnchor.constraint(equalToConstant: 120),
        ])
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
