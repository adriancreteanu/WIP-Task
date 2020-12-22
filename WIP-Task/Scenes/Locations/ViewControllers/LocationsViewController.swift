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
    
    fileprivate let cellReuseIdentifier = "LocationTableViewCell"
    
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
        viewModel.start()
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
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    // MARK: - Actions
    
    
}

// MARK: - UITableView Delegates

extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? LocationTableViewCell else {
            fatalError()
        }
        
        cell.location = viewModel.itemFor(row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(indexPath.row, from: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - ViewModel Delegate

extension LocationsViewController: LocationsViewModelViewDelegate {
    
    func updateScreen() {
        tableView.reloadData()
    }
    
}
