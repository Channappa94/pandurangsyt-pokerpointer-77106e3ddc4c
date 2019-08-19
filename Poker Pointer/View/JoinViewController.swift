//
//  JoinViewController.swift
//  Poker Pointer
//
//  Created by IMCS2 on 8/18/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import UIKit
import Firebase
var key: String?

class JoinViewController: UIViewController {
    var ref: DatabaseReference!
    var sendingValue = [String]()
    
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var keys: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checking(_ sender: Any) {
        let names = keys.text
        ref = Database.database().reference().child("Student")
        // ref.child("names")
        ref.observe(.value){(snapshot: DataSnapshot) in
            for nameValue in snapshot.children{
                let snapshotContent = nameValue as? DataSnapshot
                let namedata = snapshotContent?.value as? NSDictionary
                self.sendingValue.append(namedata?.value(forKey: "names") as! String)
                print(self.sendingValue)
            }
        }
        fetch()
        //accessing value=
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    func fetch(){

    }
    
}
