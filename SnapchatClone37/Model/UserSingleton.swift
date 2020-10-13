//
//  UserSingleton.swift
//  SnapchatClone37
//
//  Created by Luke Martin-Resnick on 10/2/20.
//

import Foundation

class UserSingleton {
    
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init() {
        
    }
    
}
