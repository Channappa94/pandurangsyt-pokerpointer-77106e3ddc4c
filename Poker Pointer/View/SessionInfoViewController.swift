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
    
    var dataforkey:String = ""
    
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
        if checkFieldsNotEmpty() {
            wrtieToFirebase()
        }
        performSegue(withIdentifier: "toVotingView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
        ref = Database.database().reference(withPath: "6003")
        let query = ref.queryOrdered(byChild: "name")
        print(query)
        
        
        
        
        //        ref.childByAutoId().child("name").setValue(user)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toVotingView"){
            let controller = segue.destination as? VotingViewController
            controller!.datafromSession = key!
            
        }
    }
    
    
    
    
}
