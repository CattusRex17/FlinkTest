//
//  EpisodeTableViewCell.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class EpisodeTableViewCell: UITableViewCell {
    
// MARK: - Public properties -
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!

    override public func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setUpWith(episodeModel episode: Episode) {
        nameLabel.text = episode.name
        episodeLabel.text = episode.episode
    }
}
