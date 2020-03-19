//
//  CustomBorderButton.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 3/18/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

/**
 Custom class for implementation Border Button
 */
public class CustomBorderButton: UIButton {

    override public func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "Main Color")?.cgColor
        self.titleLabel?.font = UIFont(name: "Roboto", size: self.frame.size.height / 3)
        self.titleLabel?.textAlignment = .center
    }
}
