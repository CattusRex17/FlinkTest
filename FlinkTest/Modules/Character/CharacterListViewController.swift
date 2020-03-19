//
//  CharacterListViewController.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class CharacterListViewController: UIViewController {
    
// MARK: - Public properties -
    @IBOutlet var tableView: UITableView!
    @IBOutlet var currentPageLabel: UILabel!
    @IBOutlet var paginationHeightContraint: NSLayoutConstraint!
    @IBOutlet var paginationStackView: UIStackView!
    let networkManager = NetworkManager()

    var characters = [Character]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }

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
        makeCharacterRequest(name: "", page: "")
        setUpSearchBar()
    }

// MARK: - Methods -
    private func setUpSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true

        let scb = searchController.searchBar
        //scb.tintColor = .rickAndMortyTitleBlue
        scb.barTintColor = UIColor.white

        if let textfield = scb.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.white
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toCharacterDetailVC" {
            if let characterDetailVC = segue.destination as? CharacterDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    characterDetailVC.character = characters[indexPath.row]
                }
            }
        }
    }

    func makeCharacterRequest(name: String, page: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        networkManager.getCharacter(name: name, page: page) { characters, info in
            self.characters = characters
            self.info = info
        }
    }

    @IBAction func previousButtonPressed(_ sender: UIButton) {
        guard let previous = info?.previousPage() else {
            return
        }
        if previous != "" {
            makeCharacterRequest(name: "", page: previous)
        }
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let next = info?.nextPage() else {
            return
        }
        if next != "" {
            makeCharacterRequest(name: "", page: next)
        }
    }
}

// MARK: - Table View Methods -
extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CharacterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        let character = characters[indexPath.row]
        cell.setUpWith(characterModel: character)
        return cell
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toCharacterDetailVC", sender: self)
    }
}

// MARK: - Search Methods -
extension CharacterListViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        makeCharacterRequest(name: text, page: "")
        paginationHeightContraint.constant = text == "" ? 30.0 : 0.0
        paginationStackView.isHidden = text == "" ? false : true
    }
}
