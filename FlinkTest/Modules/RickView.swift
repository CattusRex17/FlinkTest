//
//  RickView.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class RickView: UIView {
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.9
        layer.shadowOffset = CGSize.zero
        layer.masksToBounds = false
    }
}
