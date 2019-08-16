//
//  SessionViewModel.swift
//  Poker Pointer
//
//  Created by IMCS2 on 3/5/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import Foundation
class SessionViewModel {
    //getting all the definition fro the session which is the model
    //Assigning to a varaible
    //Performing diffent action based upon the type it is being performed
    var s = Session()
    func newSessionButtonClicked(){
        //"s" : has the property of set is moderator
        
        s.setIsModerator(isModerator: true)
    }
    func joinSessionButtonClicked(){
        s.setIsModerator(isModerator: false)
    }
    func nextButtonClicked(){
        
    }
    //Generating a random key so that the value will be gerneated between one to three
    func generateRandomKey() -> String {
        let letters = "0123456789"
        return  String((0...3).map{ _ in letters.randomElement()! })
    }
    
    func isModerator() -> Bool{
        return s.getIsModerator()
    }
    
    func getSessionKey() -> Int{
        return s.getSessionKey()
    }
    
    func setSessionKey(key: Int){
        return s.setSessionKey(sessionKey: key)
    }

}
