//
//  Models.swift
//  Zorella
//
//  Created by Kerby Jean on 2017-08-27.
//  Copyright © 2017 Flaint, Inc. All rights reserved.
//

import UIKit
import AVFoundation

struct Model {
    
    var name: String
    var picture: UIImage
    var video: String
    
    static var models = [
            
        
        Model(name: "Adonis Bosso", picture: #imageLiteral(resourceName: "1 - Adonis Bosso"), video: ""),
        Model(name: "Amandla Stenberg", picture: #imageLiteral(resourceName: "2 - Amandla Stenberg"), video: ""),
        Model(name: "Anais Mali", picture: #imageLiteral(resourceName: "3 - Anais Mali"), video: ""),
        Model(name: "Imaan Hammam", picture: #imageLiteral(resourceName: "4 - Imaan Hammam"), video: ""),
        Model(name: "Lucky Blue Smith", picture: #imageLiteral(resourceName: "5 - Lucky Blue Smith"), video: ""),
        Model(name: "Ondria Hardin", picture: #imageLiteral(resourceName: "6 - Ondria Hardin"), video: ""),
        Model(name: "Malaika Firth", picture: #imageLiteral(resourceName: "7 - Malaika Firth"), video: ""),
        Model(name: "Soo Joo Park", picture: #imageLiteral(resourceName: "8 - Soo Joo Park"), video: ""),
        Model(name: "Sang Woo Kim", picture: #imageLiteral(resourceName: "9 - Sang Woo Kim"), video: "")
   ]
}
