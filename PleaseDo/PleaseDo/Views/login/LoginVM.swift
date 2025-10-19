//
//  LoginVM.swift
//  PleaseDo
//
//  Created by nasir on 19/10/25.
//

import Foundation
import Observation

@Observable final class LoginVM  {
    enum Status{
        case unowned , login, lougout
    }
    var loginStatus: Status = .unowned
    
    var isLoggingIn : Bool = true
    
    var toggleText = "Dont have an acoonut"
    var prompt = "Sign up Here"
    
    var username: String = "nasir@gmail.com"
    var email: String = "nasir@gmail.com"
    var password: String = "nasir"
    var firstName: String = "nasir"
    var secondName: String = "nasir"
    
}
