//
//  Alert.swift
//  Zorella
//
//  Created by Kerby Jean on 2017-08-27.
//  Copyright © 2017 Flaint, Inc. All rights reserved.
//


import UIKit

class Alert {
    
    fileprivate static let _alert = Alert()
    
    static var alert: Alert {
        return _alert
    }
    
    func showAlert(_ viewController: UIViewController, title: String, action: UIAlertAction) {
        var vc = PlayerVC()
        vc = viewController as! PlayerVC
        let alert = UIAlertController(title: title, message: "", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            DispatchQueue.main.async {
                vc.player?.play()
            }
        }
        alert.addAction(cancel)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
