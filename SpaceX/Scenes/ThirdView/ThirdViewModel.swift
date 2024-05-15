//
//  ThirdViewModel.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 15.05.2024.
//

import UIKit

class ThirdViewModel {
    
    var contentView: ThirdContentView
    
    init(contentView: ThirdContentView) {
            self.contentView = contentView
        }
    
    var selectedHeightUnit: String?
    var selectedDiameterUnit: String?
    var selectedMassUnit: String?
    var selectedPayloadUnit: String?
    
    //MARK: - Intents -
    
    func saveUserDefaultsValues() {
        UserDefaults.standard.set(selectedHeightUnit, forKey: "selectedHeightUnit")
        UserDefaults.standard.set(selectedDiameterUnit, forKey: "selectedDiameterUnit")
        UserDefaults.standard.set(selectedMassUnit, forKey: "selectedMassUnit")
        UserDefaults.standard.set(selectedPayloadUnit, forKey: "selectedPayloadUnit")
    }
    
    func loadUserDefaultsValues() {
        if let heightUnit = UserDefaults.standard.string(forKey: "selectedHeightUnit") {
            selectedHeightUnit = heightUnit
            contentView.heightControl.selectedSegmentIndex = contentView.heightItems.firstIndex(of: heightUnit) ?? 0
        }
        
        if let diameterUnit = UserDefaults.standard.string(forKey: "selectedDiameterUnit") {
            selectedDiameterUnit = diameterUnit
            contentView.diameterControl.selectedSegmentIndex = contentView.diameterItems.firstIndex(of: diameterUnit) ?? 0
        }
        
        if let massUnit = UserDefaults.standard.string(forKey: "selectedMassUnit") {
            selectedMassUnit = massUnit
            contentView.massControl.selectedSegmentIndex = contentView.massItems.firstIndex(of: massUnit) ?? 0
        }
        
        if let payloadUnit = UserDefaults.standard.string(forKey: "selectedPayloadUnit") {
            selectedPayloadUnit = payloadUnit
            contentView.payloadControl.selectedSegmentIndex = contentView.payloadItems.firstIndex(of: payloadUnit) ?? 0
        }
    }
}
