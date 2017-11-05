//
//  ShowCell.swift
//  Zorella
//
//  Created by Kerby Jean on 2017-08-27.
//  Copyright © 2017 Flaint, Inc. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ShowCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var show: Show?
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var path: String?
    var timeObserver: Any?
    
    
    
    func configure(_ show: Show) {
        self.show = show
        playVideo()
        titleLabel.text = show.title
        nameLabel.text = "With \(show.name)"
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playerLayer?.removeFromSuperlayer()
        player?.pause()
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func playVideo() {
        
        let bundle = Bundle.main
        guard let name = show?.name else {
            return
        }
        
        let path = bundle.path(forResource: "\(name) chilling", ofType: "mp4")
        let url = NSURL.fileURL(withPath: path!)
        player = AVPlayer(url: url)
        player?.isMuted = true
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bgView.bounds
        playerLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer?.zPosition = 0
        bgView.layer.addSublayer(playerLayer!)
        DispatchQueue.main.async {
            self.player?.play()
        }
    }
    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        self.player?.seek(to: kCMTimeZero)
        self.player?.play()
    }
}
