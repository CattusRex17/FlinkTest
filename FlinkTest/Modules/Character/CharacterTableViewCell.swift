//
//  CharacterTableViewCell.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit
import SDWebImage

public class CharacterTableViewCell: UITableViewCell {
    
// MARK: - Public properties -
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!

    override public func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func setUpWith(characterModel character: Character) {
        nameLabel.text = character.name
        statusLabel.text = character.status
        avatarImageView.sd_setImage(with: URL(string: character.image), completed: nil)
    }
}
