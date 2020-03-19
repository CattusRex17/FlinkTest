//
//  RickImageView.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class RickImageView: UIImageView {
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
