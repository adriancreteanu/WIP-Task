//
//  LocationTableViewCell.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 21.12.2020.
//

import UIKit
import SDWebImage

class LocationTableViewCell: UITableViewCell {
    
    fileprivate var locationImageView: UIImageView!
    fileprivate var addressLabel: UILabel!
    fileprivate var distanceLabel: UILabel!
    
    var location: LocationViewDataType? {
        didSet {
            addressLabel.text = location?.address
            distanceLabel.text = location?.distance
            locationImageView.sd_setImage(with: location?.imageURL)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        locationImageView = UIImageView()
        locationImageView.contentMode = .scaleAspectFill
        locationImageView.clipsToBounds = true
        locationImageView.enableAutoLayout()
        locationImageView.backgroundColor = UIColor.systemGray
        
        addSubview(locationImageView)
        
        locationImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        locationImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        locationImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        locationImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addressLabel = UILabel()
        distanceLabel = UILabel()
        
        let vStack = UIStackView(arrangedSubviews: [
            addressLabel,
            distanceLabel
        ])
        
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.enableAutoLayout()
        addSubview(vStack)
        
        vStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        vStack.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 10).isActive = true
        vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
