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
    
    var selectedHeightUnit: String?
    var selectedDiameterUnit: String?
    var selectedMassUnit: String?
    var selectedPayloadUnit: String?
    
    
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
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .white
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
        loadUserDefaultsValues()
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
        
        heightControl.addTarget(self, action: #selector(heightControlValueChanged(_:)), for: .valueChanged)
        diameterControl.addTarget(self, action: #selector(diameterControlValueChanged(_:)), for: .valueChanged)
        massControl.addTarget(self, action: #selector(massControlValueChanged(_:)), for: .valueChanged)
        payloadControl.addTarget(self, action: #selector(payloadControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func saveButtonTapped() {
        saveUserDefaultsValues()
        dismiss(animated: true)
    }
    
    func saveUserDefaultsValues() {
        UserDefaults.standard.set(selectedHeightUnit, forKey: "selectedHeightUnit")
        UserDefaults.standard.set(selectedDiameterUnit, forKey: "selectedDiameterUnit")
        UserDefaults.standard.set(selectedMassUnit, forKey: "selectedMassUnit")
        UserDefaults.standard.set(selectedPayloadUnit, forKey: "selectedPayloadUnit")
    }
    
    func loadUserDefaultsValues() {
        if let heightUnit = UserDefaults.standard.string(forKey: "selectedHeightUnit") {
            selectedHeightUnit = heightUnit
            heightControl.selectedSegmentIndex = heightItems.firstIndex(of: heightUnit) ?? 0
        }
        
        if let diameterUnit = UserDefaults.standard.string(forKey: "selectedDiameterUnit") {
            selectedDiameterUnit = diameterUnit
            diameterControl.selectedSegmentIndex = diameterItems.firstIndex(of: diameterUnit) ?? 0
        }
        
        if let massUnit = UserDefaults.standard.string(forKey: "selectedMassUnit") {
            selectedMassUnit = massUnit
            massControl.selectedSegmentIndex = massItems.firstIndex(of: massUnit) ?? 0
        }
        
        if let payloadUnit = UserDefaults.standard.string(forKey: "selectedPayloadUnit") {
            selectedPayloadUnit = payloadUnit
            payloadControl.selectedSegmentIndex = payloadItems.firstIndex(of: payloadUnit) ?? 0
        }
    }
    
    @objc func heightControlValueChanged(_ sender: UISegmentedControl) {
        selectedHeightUnit = heightItems[sender.selectedSegmentIndex]
    }
    @objc func diameterControlValueChanged(_ sender: UISegmentedControl) {
        selectedDiameterUnit = diameterItems[sender.selectedSegmentIndex]
    }
    @objc func massControlValueChanged(_ sender: UISegmentedControl) {
        selectedMassUnit = massItems[sender.selectedSegmentIndex]
    }
    @objc func payloadControlValueChanged(_ sender: UISegmentedControl) {
        selectedPayloadUnit = payloadItems[sender.selectedSegmentIndex]
    }
    
    
}
