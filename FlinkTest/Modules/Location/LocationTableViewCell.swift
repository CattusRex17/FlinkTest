//
//  LocationTableViewCell.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class LocationTableViewCell: UITableViewCell {

// MARK: - Public properties -
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var dimensionLabel: UILabel!

// MARK: - Lifecycle -
    override public func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

// MARK: - Methods -
    func setUpWith(locationModel location: Location) {
        nameLabel.text = location.name
        typeLabel.text = location.type
        dimensionLabel.text = location.dimension
    }
}
