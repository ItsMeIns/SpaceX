//
//  ThirdViewController.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - Properties
    
    private let contentView = ThirdContentView()
    var thirdViewModel: ThirdViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        thirdViewModel?.loadUserDefaultsValues()
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        
        contentView.heightControl.addTarget(self, action: #selector(heightControlValueChanged(_:)), for: .valueChanged)
        contentView.diameterControl.addTarget(self, action: #selector(diameterControlValueChanged(_:)), for: .valueChanged)
        contentView.massControl.addTarget(self, action: #selector(massControlValueChanged(_:)), for: .valueChanged)
        contentView.payloadControl.addTarget(self, action: #selector(payloadControlValueChanged(_:)), for: .valueChanged)
        contentView.backButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    
    @objc private func saveButtonTapped() {
        thirdViewModel?.saveUserDefaultsValues()
        dismiss(animated: true)
    }
    
    
    
    @objc func heightControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedHeightUnit = contentView.heightItems[sender.selectedSegmentIndex]
    }
    @objc func diameterControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedDiameterUnit = contentView.diameterItems[sender.selectedSegmentIndex]
    }
    @objc func massControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedMassUnit = contentView.massItems[sender.selectedSegmentIndex]
    }
    @objc func payloadControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedPayloadUnit = contentView.payloadItems[sender.selectedSegmentIndex]
    }
    
    
}
