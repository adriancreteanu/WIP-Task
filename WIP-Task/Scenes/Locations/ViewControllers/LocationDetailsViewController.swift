//
//  LocationDetailsViewController.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 22.12.2020.
//

import UIKit
import SDWebImage

class LocationDetailsViewController: UIViewController {
    
    fileprivate var headerImageView: UIImageView!
    fileprivate var labelDetailView: DetailView!
    fileprivate var addressDetailView: DetailView!
    fileprivate var latDetailView: DetailView!
    fileprivate var lngDetailView: DetailView!
    
    // MARK: - Properties
    
    var viewModel: LocationDetailsViewModel! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setup()
        viewModel.start()
    }
    
    func setup() {
        view.backgroundColor = .white
        
        headerImageView = UIImageView()
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        headerImageView.enableAutoLayout()
        
        view.addSubview(headerImageView)
        
        headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        headerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 3).isActive = true
        
        labelDetailView = DetailView(title: "Label")
        addressDetailView = DetailView(title: "Address")
        latDetailView = DetailView(title: "Lat")
        lngDetailView = DetailView(title: "Long")
        
        let coordinatesStack = UIStackView(arrangedSubviews: [
            latDetailView,
            lngDetailView
        ])
        
        coordinatesStack.distribution = .fillEqually
        coordinatesStack.alignment = .fill
        
        let vStack = UIStackView(arrangedSubviews: [
            labelDetailView,
            addressDetailView,
            coordinatesStack
        ])
        
        vStack.axis = .vertical
        vStack.spacing = 10
        vStack.alignment = .fill
        vStack.enableAutoLayout()
        
        view.addSubview(vStack)
        
        vStack.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 20).isActive = true
        vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - Actions
    
    
}

extension LocationDetailsViewController: LocationDetailsViewModelViewDelegate {
    
    func updateScreen(location: Location) {
        
        let imageURL = URL(string: location.imageStringURL)
        headerImageView.sd_setImage(with: imageURL)
        
        labelDetailView.value = location.label
        addressDetailView.value = location.address
        latDetailView.value = String(location.latitude)
        lngDetailView.value = String(location.longitude)
    }
    
}
