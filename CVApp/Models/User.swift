//
//  User.swift
//  CVApp
//
//  Created by pavel on 24.10.2020.
//

import Foundation

let validUserName = "User"
let validPassword = "password"

struct User {
    var name: String;
    var password: String;
}

extension User {
    
    
    public func isValid() -> Bool {
        name == validUserName && password == validPassword
    }
}
