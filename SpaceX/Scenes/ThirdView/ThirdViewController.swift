//
//  ThirdViewController.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
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
    
    let diameterLabel: UILabel = {
        let label = UILabel()
        label.text = "Diameter"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let massLabel: UILabel = {
        let label = UILabel()
        label.text = "Mass"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let payloadLabel: UILabel = {
        let label = UILabel()
        label.text = "Payload"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(diameterLabel)
        view.addSubview(massLabel)
        view.addSubview(payloadLabel)
        
        NSLayoutConstraint.activate([
            settingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            heightLabel.topAnchor.constraint(equalTo: settingLabel.bottomAnchor, constant: 70),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            diameterLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 45),
            diameterLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            massLabel.topAnchor.constraint(equalTo: diameterLabel.bottomAnchor, constant: 45),
            massLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            payloadLabel.topAnchor.constraint(equalTo: massLabel.bottomAnchor, constant: 45),
            payloadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
        ])
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
}
