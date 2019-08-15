//
//  SessionViewModel.swift
//  Poker Pointer
//
//  Created by IMCS2 on 3/5/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import Foundation
class SessionViewModel {
    var s = Session()
    func newSessionButtonClicked(){
        s.setIsModerator(isModerator: true)
    }
    func joinSessionButtonClicked(){
        s.setIsModerator(isModerator: false)
    }
    func nextButtonClicked(){
        
    }
    
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
