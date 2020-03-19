//
//  ViewController.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var episodeButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var characterButton: UIButton!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView() {
        mainLabel.text = "Select Option"
    }
}
