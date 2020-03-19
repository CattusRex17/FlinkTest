//
//  EpisodeListViewController.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class EpisodeListViewController: BaseListViewController {
    
// MARK: - Public properties -
    let networkManager = NetworkManager()
    var episodes = [Episode]() {
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
        makeEpisodeRequest(name: "", page: "")
    }

// MARK: - Methods -
    func makeEpisodeRequest(name: String, page: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        networkManager.getEpisode(name: name, page: page) { episodes, info in
            self.episodes = episodes
            self.info = info
        }
    }

    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toEpisodeDetailVC" {
            if let episodeDetailVC = segue.destination as? EpisodeDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    episodeDetailVC.episode = episodes[indexPath.row]
                }
            }
        }
    }

    override public func updateSearchResults(for searchController: UISearchController) {
        super.updateSearchResults(for: searchController)
        guard let text = searchController.searchBar.text else {
            return
        }
        makeEpisodeRequest(name:text, page: "")
    }

    @IBAction func previousButtonPressed(_ sender: UIButton) {
        guard let previous = info?.previousPage() else {
            return
        }
        if previous != "" {
            makeEpisodeRequest(name: "", page: previous)
        }
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        guard let next = info?.nextPage() else {
            return
        }
        if next != "" {
            makeEpisodeRequest(name: "", page: next)
        }
    }
}

// MARK: - Table View Methods -
extension EpisodeListViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toEpisodeDetailVC", sender: self)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: EpisodeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "episodeCell") as? EpisodeTableViewCell else {
            return UITableViewCell()
        }
        let episode = episodes[indexPath.row]
        cell.setUpWith(episodeModel: episode)
        return cell
    }
}
