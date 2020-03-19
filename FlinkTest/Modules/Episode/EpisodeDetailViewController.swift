//
//  EpisodeDetailViewController.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class EpisodeDetailViewController: UIViewController {

// MARK: - Public properties -
    @IBOutlet var tableView: UITableView!
    @IBOutlet var airDateLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var charactersLabel: UILabel!
    let networkManager = NetworkManager()
    var episode: Episode?
    
    var characters = [Character]() {
        didSet {
            tableView.reloadData()
        }
    }
    
// MARK: - Lifecycle -
    override public func viewDidLoad() {
        super.viewDidLoad()
        makeCharactersRequest()
        title = episode?.name
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "Gray Main")
    }

// MARK: - Methods -
    func makeCharactersRequest() {
        if let characterIds = episode?.characterIds() {
            networkManager.getCharactersWith(ids: characterIds) { characters in
                self.characters = characters
            }
        }
    }

    func characterNamesAsString() -> String {
        var characterNames = ""
        for character in characters {
            characterNames.append(character.name + " \n")
        }
        return characterNames
    }
}

extension EpisodeDetailViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as? DetailTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.row {
        case 0:
            cell.detailTypeLabel.text = "Air Date:"
            cell.detailInfoLabel.text = episode?.airDate
        case 1:
            cell.detailTypeLabel.text = "Episode:"
            cell.detailInfoLabel.text = episode?.episode
        case 2:
            cell.detailTypeLabel.text = "Characters:"
            cell.detailInfoLabel.text = characterNamesAsString()
        default:
            return UITableViewCell()
        }
        return cell
    }
}
