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
    var imageViews: [UIImageView] = []
    var contentView: FirstContentView
    var currentRocketIndex = 0
    
    
    init(contentView: FirstContentView) {
            self.contentView = contentView
        }
    
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
    
    func updateImageViews(with imageNames: [String]) {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = contentView.scrollViewRocketImage.bounds.height
        contentView.scrollViewRocketImage.contentSize = CGSize(width: screenWidth * CGFloat(imageNames.count), height: screenHeight)
        
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
            contentView.scrollViewRocketImage.addSubview(imageView)
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
    
}


extension Notification.Name {
    static let updateUI = Notification.Name("UpdateUI")
}
