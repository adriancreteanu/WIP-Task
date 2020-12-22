//
//  DetailView.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import UIKit

class DetailView: UIView {
    
    fileprivate var titleLabel: UILabel!
    fileprivate var valueField: UITextField!
    
    var value: String? {
        didSet {
            valueField.text = value
        }
    }
    
    convenience init(
        title: String
    ) {
        
        self.init(frame: .zero)
        
        setup()
        titleLabel.text = title
    }
    
    func setup() {
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.systemBlue
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        valueField = UITextField()
        valueField.font = UIFont.systemFont(ofSize: 14)
        
        let vStack = UIStackView(arrangedSubviews: [
            titleLabel,
            valueField
        ])
        
        vStack.axis = .vertical
        vStack.spacing = 5
        vStack.enableAutoLayout()
        
        addSubview(vStack)
        
        vStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    
    }
    
}
