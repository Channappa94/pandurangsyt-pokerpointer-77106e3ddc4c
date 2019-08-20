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
    var keyName:String = ""
    
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var keys: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checking(_ sender: Any) {
        keyName = keys.text!
        //      ref = Database.database().reference().child("Student")
        ref = Database.database().reference()
        ref.child(String(keyName)).observeSingleEvent(of: .value, with: {(snapshot) in
            if snapshot.exists(){
                print("exists")
            }else{
                //Create alert controller here
                let alert = UIAlertController(title: "Hello", message: "This is not the key", preferredStyle: .alert)
                let action = UIAlertAction(title: "Yes", style: .default, handler: nil)
                alert.addAction(<#T##action: UIAlertAction##UIAlertAction#>)
                print("False")
            }
            
            let nameOfUser = self.Name.text
            
            //Writing the data inside the firebase
            self.ref = Database.database().reference().child(self.keyName)
            self.ref.childByAutoId().child("name").setValue(nameOfUser)
            
        })
        performSegue(withIdentifier: "fromJoining", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "fromJoining"){
            let controller = segue.destination as? VotingViewController
            controller!.datafromJoin = keyName
            
        }
    }
    
    
    
    
}
