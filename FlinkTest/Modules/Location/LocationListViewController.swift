//
//  LocationListViewController.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class LocationListViewController: BaseListViewController {

// MARK: - Public properties -
    let networkManager = NetworkManager()
    var locations = [Location]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }

// MARK: - Lifecycle -
    override public func viewDidLoad() {
        super.viewDidLoad()
        makeLocationRequest(name: "", page: "")
    }

// MARK: - Methods -
    func makeLocationRequest(name: String, page: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        networkManager.getLocation(name: name, page: page) { locations, info in
            self.locations = locations
            self.info = info
        }
    }

    override public func updateSearchResults(for searchController: UISearchController) {
        super.updateSearchResults(for: searchController)
        guard let text = searchController.searchBar.text else {
            return
        }
        makeLocationRequest(name: text, page: "")
    }

    @IBAction func previousButtonPressed(_ sender: UIButton) {
        guard let previous = info?.previousPage() else {
            return
        }
        if previous != "" {
            makeLocationRequest(name: "", page: previous)
        }
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let next = info?.nextPage() else {
            return
        }
        if next != "" {
            makeLocationRequest(name: "", page: next)
        }
    }
}

// MARK: - Table View Methods -
extension LocationListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "locationCell") as? LocationTableViewCell else {
            return UITableViewCell()
        }
        let location = locations[indexPath.row]
        cell.setUpWith(locationModel: location)
        return cell
    }
}
