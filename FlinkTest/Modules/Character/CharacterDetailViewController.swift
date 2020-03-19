//
//  CharacterDetailViewController.swift
//  FlinkTest
//
//  Created by Mauricio Rodriguez on 18/03/20.
//  Copyright © 2020 Mauricio Rodriguez. All rights reserved.
//

import UIKit
import SDWebImage

public class CharacterDetailViewController: UIViewController {
    
// MARK: - Public properties -
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    var character: Character?

// MARK: - Lifecycle -
    override public func viewDidLoad() {
        super.viewDidLoad()
        characterImageView.sd_setImage(with: URL(string: (character?.image)!), completed: nil)
        title = character?.name
        statusLabel.text = character?.status
        speciesLabel.text = character?.species
        typeLabel.text = character?.type == "" ? "Not Available" : character?.type
        originLabel.text = character?.origin.name
        locationLabel.text = character?.location.name
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
