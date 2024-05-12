//
//  CollectionViewParameterInfoCell.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 05.05.2024.
//

import UIKit

class ParameterInfoCell: UICollectionViewCell {
    
    var heightUnit: String?
    var diameterUnit: String?
    var massUnit: String?
    var payloadUnit: String?
    
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
            case "height (m)":
                valueLabel.text = "\(rocket.height.meters ?? 0)"
            case "height (ft)":
                valueLabel.text = "\(rocket.height.feet ?? 0)"
            case "diameter (m)":
                valueLabel.text = "\(rocket.diameter.meters ?? 0)"
            case "diameter (ft)":
                valueLabel.text = "\(rocket.diameter.feet ?? 0)"
            case "mass (kg)":
                valueLabel.text = "\(rocket.mass.kg)"
            case "mass (lb)":
                valueLabel.text = "\(rocket.mass.lb)"
            case "payload (kg)":
                if let payloadWeight = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
                    valueLabel.text = "\(payloadWeight.kg)"
                }
            case "payload (lb)":
                if let payloadWeight = rocket.payloadWeights.first(where: { $0.id == "leo" }) {
                    valueLabel.text = "\(payloadWeight.lb)"
                }
            default:
                valueLabel.text = "-"
            }
        }
    }
    
    func configure(with title: String, unit: String) {
        titleLabel.text = "\(title) (\(unit))"
        updateLabels()
    }
}
