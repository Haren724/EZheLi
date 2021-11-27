//
//  Login.swift
//  EZheLi
//
//  Created by 陈驰坤 on 2021/11/28.
//

import Foundation


struct UserInfo {
    
    init(_ usr: String, _ pwd: String) {
        self.username = usr
        self.password = pwd
    }
    
    var username: String
    var password: String
    
    func checkUsername() -> Bool {
        return true
    }
    
    
}


let Haren = UserInfo("2020316101023", "Chenchikun108")
let Longwatry = UserInfo("2020316101062", "Hyzx3677")
