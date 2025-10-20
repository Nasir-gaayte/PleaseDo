//
//  LoginVM.swift
//  PleaseDo
//
//  Created by nasir on 19/10/25.
//

import Foundation
import Observation

@Observable final class LoginVM  {
    private let auth = LoginManager()
    enum Status{
        case unowned , login, lougout
    }
    var loginStatus: Status = .unowned
    
    var isLoggingIn : Bool = false {
        willSet{
            self.loginStatus = newValue ? .login : .unowned
        }
    }
    
    var toggleText = "Dont have an acoonut"
    var prompt = "Sign up Here"
    
   
    var email: String = ""
    var password: String = ""
    
    
    var firstName: String = ""
    var secondName: String = ""
    var newMail : String = ""
    var newPW : String = ""

    func signUp() {
        

        auth.signUp(firstName, secondName, newMail, newPW)
    }
    
}
