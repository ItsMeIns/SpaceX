//
//  FirstViewModel.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 04.05.2024.
//

import UIKit

class FirstViewModel {
    
    //MARK: - Properties -
    var rocketInfo: [RocketInfo] = []
    var currentRocketIndex = 0
    
    
    //MARK: - Intents -
    func fetchRocketInfo() {
        NetworkManager.shared.getRocketInfo { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let rocketInfoArray):
                self.rocketInfo = rocketInfoArray
                self.updateUI()
            case .failure(let error):
                print("Failed to fetch rocket info: \(error)")
            }
        }
    }
    
    func updateUI() {
        guard !rocketInfo.isEmpty else { return }
        
        let currentRocketInfo = rocketInfo[currentRocketIndex]
        
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .updateUI, object: self, userInfo: ["rocket": currentRocketInfo])
        }
    }
    
    func getRandomImageForCurrentRocket() -> String? {
        guard !rocketInfo.isEmpty else { return nil }
        let currentRocket = rocketInfo[currentRocketIndex]
        return currentRocket.flickrImages.randomElement()
    }
    
}


extension Notification.Name {
    static let updateUI = Notification.Name("UpdateUI")
}
