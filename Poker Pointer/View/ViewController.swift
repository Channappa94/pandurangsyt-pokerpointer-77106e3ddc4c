//
//  ViewController.swift
//  Poker Pointer
//
//  Created by Pandu on 2/27/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import UIKit
var s: SessionViewModel = SessionViewModel()
class ViewController: UIViewController {
    
    @IBAction func StartSessionAction(_ sender: Any) {
        s.newSessionButtonClicked()
    }
    
    @IBAction func JoinSessionAction(_ sender: Any) {
        s.joinSessionButtonClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

