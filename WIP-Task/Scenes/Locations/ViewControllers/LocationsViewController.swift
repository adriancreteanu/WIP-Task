//
//  LocationsViewController.swift
//  WIP-Task
//
//  Created by Adrian Crețeanu on 20.12.2020.
//

import UIKit

class LocationsViewController: UIViewController {
    
    // MARK: - Properties
    
    fileprivate var tableView: UITableView!
    
    var viewModel: LocationsViewModelDelegate! {
        didSet {
            viewModel.viewDelegate = self
        }
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupTableView()
        
        // Move this to api client
        let url = URL(string: "http://demo1042273.mockable.io/mylocations")!
        let data = try? Data(contentsOf: url)
        
        if let data = data {
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            print(json)
        }
        
    }
    
    func setup() {
        tableView = UITableView()
        tableView.enableAutoLayout()
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Actions
    
    
}

// MARK: - UITableView Delegates

extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - ViewModel Delegate

extension LocationsViewController: LocationsViewModelViewDelegate {
    
    func updateScreen() {
        tableView.reloadData()
    }
    
}
