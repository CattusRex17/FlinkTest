//
//  DetailTableViewCell.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class DetailTableViewCell: UITableViewCell {
    @IBOutlet var detailTypeLabel: UILabel!
    @IBOutlet var detailInfoLabel: UILabel!

    override public func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = UIColor(named: "Gray Main")
    }
}
