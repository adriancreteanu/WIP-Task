//
//  LocationTableViewCell.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 21.12.2020.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    //fileprivate var locationImageView: UIImageView!
    fileprivate var addressLabel: UILabel!
    fileprivate var distanceLabel: UILabel!
    
    var location: LocationViewDataType? {
        didSet {
            // if empty -> unknown address?
            addressLabel.text = location?.address
            distanceLabel.text = location?.distance
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
        //locationImageView = UIImageView()
        
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
        vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
}
