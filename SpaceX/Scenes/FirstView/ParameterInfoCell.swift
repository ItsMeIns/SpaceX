//
//  CollectionViewParameterInfoCell.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 05.05.2024.
//

import UIKit

class ParameterInfoCell: UICollectionViewCell {
    
    
    
    var rocket: RocketInfo? {
        didSet {
            updateLabels()
        }
    }
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(valueLabel)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLabels() {
        if let rocket = rocket {
            switch titleLabel.text {
            case "height":
                valueLabel.text = "\(rocket.height.meters ?? 0)"
            case "diameter":
                valueLabel.text = "\(rocket.diameter.meters ?? 0)"
            case "mass":
                valueLabel.text = "\(rocket.mass.kg ?? 0)"
            case "payload":
                if let payloadWeight = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
                    valueLabel.text = "\(payloadWeight.kg)"
                }
            default:
                valueLabel.text = "-"
            }
        }
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
