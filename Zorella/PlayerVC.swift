//
//  PlayerVC.swift
//  Zorella
//
//  Created by Kerby Jean on 2017-08-27.
//  Copyright © 2017 Flaint, Inc. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerVC: UIViewController {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var path: String?
    var model: Model?
    var timeObserver: Any?
    var hidesStatusBar: Bool = true


    
    
    override var prefersStatusBarHidden: Bool {
        return hidesStatusBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesStatusBar = true
        playVideo()
        setupViews()
        
        let interval = CMTime(seconds: 0.05, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { elapsedTime in
            self.updateSlider(elapsedTime: elapsedTime)
        })
        
         NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
            playerLayer?.removeFromSuperlayer()
            player?.pause()
            NotificationCenter.default.removeObserver(self)
            player?.removeTimeObserver(timeObserver!)
    }
    
    
    func setupViews()  {
        pictureImageView.heroID = model?.name
        nameLabel.heroID = model?.name
        pictureImageView.image = model?.picture
        nameLabel.text = model?.name
        slider.setThumbImage(UIImage() , for: .normal)
        slider.alpha = 1.0
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        hidesStatusBar = false
        setNeedsStatusBarAppearanceUpdate()
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewControllerNav") as! UINavigationController
        self.hero_replaceViewController(with: vc)
    }
    
    
    @IBAction func menuButton(_ sender: Any) {
        player?.pause()
        let report = UIAlertAction(title: "Report a problem", style: .destructive) { (action) in
            
        }
        Alert.alert.showAlert(self, title: "Did something offended you? 😨", action: report)
    }
    
     func playVideo() {
        
        let bundle = Bundle.main
        guard let name = model?.name else {
            return
        }
        
        let path = bundle.path(forResource: "\(name) interview", ofType: "mp4")
        let url = NSURL.fileURL(withPath: path!)
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = view.bounds
        playerLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer?.zPosition = 1
        view.layer.addSublayer(playerLayer!)
        DispatchQueue.main.async {
            self.player?.play()
        }
    }
    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        self.player?.seek(to: kCMTimeZero)
        self.player?.play()
    }
    
    
    func updateSlider(elapsedTime: CMTime) {
        let playerDuration = playerItemDuration()
        if CMTIME_IS_INVALID(playerDuration) {
            slider.minimumValue = 0.0
            return
        }
        let duration = Float(CMTimeGetSeconds(playerDuration))
        if duration.isFinite && duration > 0 {
            slider.minimumValue = 0.0
            slider.maximumValue = duration
            let time = Float(CMTimeGetSeconds(elapsedTime))
            slider.setValue(time, animated: true)
        }
    }
    
    private func playerItemDuration() -> CMTime {
        let thePlayerItem = player?.currentItem
        if thePlayerItem?.status == .readyToPlay {
            return thePlayerItem!.duration
        }
        return kCMTimeInvalid
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
