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
    
    var location: Location? {
        didSet {
            // if empty -> unknown address?
            addressLabel.text = location?.address
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
        addressLabel.enableAutoLayout()
        addSubview(addressLabel)
        
        addressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    }
}
