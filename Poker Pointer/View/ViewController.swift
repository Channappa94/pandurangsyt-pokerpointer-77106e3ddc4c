//
//  ViewController.swift
//  Poker Pointer
//
//  Created by Pandu on 2/27/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import UIKit
import AVFoundation


var s: SessionViewModel = SessionViewModel()
class ViewController: UIViewController {
    var players : AVPlayer?
    @IBAction func StartSessionAction(_ sender: Any) {
        s.newSessionButtonClicked()
    }
    
    @IBAction func JoinSessionAction(_ sender: Any) {
        s.joinSessionButtonClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
        setupNavigationItems()
    }
    
    
    @IBOutlet weak var videoView: UIView!
    //This is for adding background video for vi\ew controller
    func setupView(){
        let path = Bundle.main.path(forResource: "video", ofType: "mov")
        players = AVPlayer(url: URL(fileURLWithPath: path!))
        players!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: players)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: players?.currentItem)
        players?.seek(to: CMTime.zero)
        players?.play()
        self.players?.isMuted = true
        
    }
    
    @objc func playerItemDidReachEnd(){
        players?.seek(to: CMTime.zero)
        
    }
    
    //the function helps in adding title to navigation controller
    private func setupNavigationItems() {
        let label = UILabel()
        //Diables the auto resize of the image
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Poker Pointer"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        navigationItem.titleView = label
        //Helps in centering the label to the left of navigation bar
        if let navigationBar = navigationController?.navigationBar {
            label.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, constant: -40).isActive = true
        }
    }
    

    

}

