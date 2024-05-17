//
//  ThirdViewController.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //MARK: - Properties
    
    weak var delegate: ThirdViewControllerDelegate?
    private let contentView = ThirdContentView()
    var thirdViewModel: ThirdViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        thirdViewModel = ThirdViewModel(contentView: contentView)
        thirdViewModel?.loadUserDefaultsValues()
        
        contentView.heightControl.addTarget(self, action: #selector(heightControlValueChanged(_:)), for: .valueChanged)
        contentView.diameterControl.addTarget(self, action: #selector(diameterControlValueChanged(_:)), for: .valueChanged)
        contentView.massControl.addTarget(self, action: #selector(massControlValueChanged(_:)), for: .valueChanged)
        contentView.payloadControl.addTarget(self, action: #selector(payloadControlValueChanged(_:)), for: .valueChanged)
        contentView.backButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        
        
    }
    
    
    @objc private func saveButtonTapped() {
        thirdViewModel?.saveUserDefaultsValues()
        delegate?.didUpdateUnits()
        dismiss(animated: true)
    }
    
    
    
    @objc func heightControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedHeightUnit = contentView.heightItems[sender.selectedSegmentIndex]
        delegate?.didUpdateUnits()
    }
    @objc func diameterControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedDiameterUnit = contentView.diameterItems[sender.selectedSegmentIndex]
        delegate?.didUpdateUnits()
    }
    @objc func massControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedMassUnit = contentView.massItems[sender.selectedSegmentIndex]
        delegate?.didUpdateUnits()
    }
    @objc func payloadControlValueChanged(_ sender: UISegmentedControl) {
        thirdViewModel?.selectedPayloadUnit = contentView.payloadItems[sender.selectedSegmentIndex]
        delegate?.didUpdateUnits()
    }
    
    
}
