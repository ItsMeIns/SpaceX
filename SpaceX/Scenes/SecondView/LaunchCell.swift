//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 09.05.2024.
//

import UIKit

class LaunchCell: UITableViewCell {
    
    let customBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .darkGreyColorBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rocketImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let rocketLogoView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .label
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(customBackgroundView)
        customBackgroundView.addSubview(rocketLogoView)
        customBackgroundView.addSubview(nameLabel)
        customBackgroundView.addSubview(dateLabel)
        customBackgroundView.addSubview(rocketImageView)
        
        
        NSLayoutConstraint.activate([
            customBackgroundView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            customBackgroundView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            customBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            customBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            rocketLogoView.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: 16),
            rocketLogoView.centerYAnchor.constraint(equalTo: customBackgroundView.centerYAnchor),
            rocketLogoView.heightAnchor.constraint(equalToConstant: 35),
            rocketLogoView.widthAnchor.constraint(equalToConstant: 35),
            
            nameLabel.leftAnchor.constraint(equalTo: rocketLogoView.rightAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: customBackgroundView.topAnchor, constant: 16),
            
            dateLabel.leftAnchor.constraint(equalTo: rocketLogoView.rightAnchor, constant: 16),
            dateLabel.bottomAnchor.constraint(equalTo: customBackgroundView.bottomAnchor, constant: -16),
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            
            rocketImageView.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: -16),
            rocketImageView.centerYAnchor.constraint(equalTo: customBackgroundView.centerYAnchor),
            rocketImageView.heightAnchor.constraint(equalToConstant: 24),
            rocketImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
    func configure(launch: Launch) {
        nameLabel.text = launch.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: launch.dateUTC) {
            dateFormatter.dateFormat = "d MMMM yyyy"
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = "Invalid Date"
        }
        
        guard let patchImageURL = URL(string: launch.links.patch.small ?? "") else {
            rocketLogoView.image = UIImage(systemName: "questionmark")
            return
        }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: patchImageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.rocketLogoView.image = image
                    }
                }
            }
        }
        
        
        if let isSuccessful = launch.success {
            if isSuccessful {
                rocketImageView.image = UIImage(named: "rocketUP")
                rocketImageView.tintColor = .green
            } else {
                rocketImageView.image = UIImage(named: "rocketDOWN")
                rocketImageView.tintColor = .red
            }
        } else {
            rocketImageView.image = UIImage(systemName: "questionmark")
            rocketImageView.tintColor = .gray
        }
    }
}
