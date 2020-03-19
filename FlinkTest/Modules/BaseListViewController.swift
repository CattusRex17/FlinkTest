//
//  BaseListViewController.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class BaseListViewController: UIViewController {

// MARK: - Public properties -
    @IBOutlet var tableView: UITableView!
    @IBOutlet var currentPageLabel: UILabel!
    @IBOutlet var paginationHeightContraint: NSLayoutConstraint!
    @IBOutlet var paginationStackView: UIStackView!

    var info: Info? {
        didSet {
            DispatchQueue.main.async {
                self.currentPageLabel.text = self.info?.currentPage()
            }
        }
    }

// MARK: - Lifecycle -
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.view.backgroundColor = .white
        configureSearchBar()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    }

// MARK: - Methods -
    private func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        let scb = searchController.searchBar
        scb.barTintColor = UIColor.white
        if let textfield = scb.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }
    }
}

// MARK: - Search Methods -
extension BaseListViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        paginationHeightContraint.constant = text == "" ? 30.0 : 0.0
        paginationStackView.isHidden = text == "" ? false : true
    }
}
