//
//  SessionInfoViewController.swift
//  Poker Pointer
//
//  Created by IMCS2 on 3/4/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SessionInfoViewController: UIViewController {
    //*****Firebase
    var userKey: String?
    var scrumKey: String?
    var ref: DatabaseReference!
    var sendingValue = [String]()
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var sessionKeyLabel: UILabel!
    @IBOutlet weak var sessionKeyTextField: UITextField!
    
    @IBOutlet weak var email: UITextField!
    @IBAction func NextButtonAction(_ sender: Any) {
        //We are checking if the textfield is empyt
        if checkFieldsNotEmpty() {
            //If it is not empty
            wrtieToFirebase()
            fetchDataFromFirebase()

        }
 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        readyPage()
 
    }
    
    func readyPage(){
        if s.isModerator(){
            sessionKeyTextField.isHidden = s.isModerator()
            sessionKeyLabel.isHidden = !s.isModerator()
            key = s.generateRandomKey()
            sessionKeyLabel.text = key
            s.setSessionKey(key: Int(key!)!)
        }else{
            userKey = sessionKeyTextField.text
            sessionKeyLabel.isHidden = !s.isModerator()
            sessionKeyTextField.isHidden = s.isModerator()
        }
    }
    
    //Putting an alert controller in case if the text field is empty is is going to give user alert
    func checkFieldsNotEmpty()->Bool{
        if displayNameTextField.text == ""{
            let alert = UIAlertController(title: "Error", message: "Display name cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
            return false
        }else if sessionKeyTextField.text == "" && !s.isModerator(){
            //Same applies if the otehr field is empty or no
            let alert = UIAlertController(title: "Error", message: "Session Key cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
            return false
        }
        return true
    }
 
    func wrtieToFirebase(){
        let user = displayNameTextField.text
        //Writing the data inside the firebase
        ref = Database.database().reference().child("\(key!)")
        ref.childByAutoId().child("name").setValue(user)
    }
    
    
    func fetchDataFromFirebase(){
//        ref = Database.database().reference()
//        ref.child("\(key)").observeSingleEvent(of: .value, with: {(snapshot) in
//            print(snapshot.key)
//            key = snapshot.key
//        })
    }


}
