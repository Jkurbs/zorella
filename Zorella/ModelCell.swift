//
//  ModelCell.swift
//  Zorella
//
//  Created by Kerby Jean on 2017-08-27.
//  Copyright © 2017 Flaint, Inc. All rights reserved.
//

import UIKit
import AVFoundation


class ModelCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(_ model: Model) {
        
        pictureImageView.layer.cornerRadius = pictureImageView.frame.height / 2
        
        pictureImageView.image = model.picture
        nameLabel.text = model.name
        pictureImageView.heroID = model.name
        nameLabel.heroID = model.name
        
        
    }
}
