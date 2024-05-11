//
//  ThirdViewController.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    //MARK: - Properties
    let heightItems = ["m", "ft"]
    let diameterItems = ["m", "ft"]
    let massItems = ["kg", "lb"]
    let payloadItems = ["kg", "lb"]
    
    
    //MARK: - UI Elements
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
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(settingLabel)
        view.addSubview(backButton)
        
        view.addSubview(heightLabel)
        view.addSubview(heightControl)
        view.addSubview(diameterLabel)
        view.addSubview(diameterControl)
        view.addSubview(massLabel)
        view.addSubview(massControl)
        view.addSubview(payloadLabel)
        view.addSubview(payloadControl)
        
        NSLayoutConstraint.activate([
            settingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            heightLabel.topAnchor.constraint(equalTo: settingLabel.bottomAnchor, constant: 70),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            heightControl.topAnchor.constraint(equalTo: settingLabel.bottomAnchor, constant: 60),
            heightControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            heightControl.heightAnchor.constraint(equalToConstant: 40),
            heightControl.widthAnchor.constraint(equalToConstant: 120),
            
            diameterLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 45),
            diameterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            diameterControl.topAnchor.constraint(equalTo: heightControl.bottomAnchor, constant: 35),
            diameterControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            diameterControl.heightAnchor.constraint(equalToConstant: 40),
            diameterControl.widthAnchor.constraint(equalToConstant: 120),
            
            massLabel.topAnchor.constraint(equalTo: diameterLabel.bottomAnchor, constant: 45),
            massLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            massControl.topAnchor.constraint(equalTo: diameterControl.bottomAnchor, constant: 35),
            massControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            massControl.heightAnchor.constraint(equalToConstant: 40),
            massControl.widthAnchor.constraint(equalToConstant: 120),
            
            payloadLabel.topAnchor.constraint(equalTo: massLabel.bottomAnchor, constant: 45),
            payloadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            payloadControl.topAnchor.constraint(equalTo: massControl.bottomAnchor, constant: 35),
            payloadControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            payloadControl.heightAnchor.constraint(equalToConstant: 40),
            payloadControl.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
}
