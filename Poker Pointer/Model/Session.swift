//
//  Session.swift
//  Poker Pointer
//
//  Created by IMCS2 on 3/3/19.
//  Copyright © 2019 123 Apps Studio LLC. All rights reserved.
//

import Foundation

class Session{
    private var sessionKey: Int
    private var displayName: String
    private var selectedPoint: Int?
    private var isModerator: Bool
    
    init(){
        sessionKey = 0
        displayName = ""
        selectedPoint = 0
        isModerator = false
    }
    init(sessionKey: Int, displayName: String, selectedPoint: Int?, isModerator: Bool) {
        self.sessionKey = sessionKey
        self.displayName = displayName
        self.selectedPoint = selectedPoint
        self.isModerator = isModerator
    }
    //setters
    func setSessionKey(sessionKey: Int){
        self.sessionKey = sessionKey
    }
    func setDisplayName(displayName: String){
        self.displayName = displayName
    }
    func setSelectedPoint(selectedPoint: Int?){
        self.selectedPoint = selectedPoint
    }
    func setIsModerator(isModerator: Bool){
        self.isModerator = isModerator
    }
    //getters
    func getSessionKey()->Int{
        return sessionKey
    }
    func getDisplayName()->String{
        return displayName
    }
    func getSeletedPoint()->Int?{
        return selectedPoint
    }
    func getIsModerator()->Bool{
        return isModerator
    }
   
    
}
