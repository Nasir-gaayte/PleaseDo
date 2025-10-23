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
        case unowned , loggedIn, loggedOut
    }
    var loginStatus: Status = .unowned
    
    var isLoggedIn : Bool = false
    
    var toggleText = "Dont have an acoonut"
    var prompt = "Sign up Here"
    
   
    var email: String = ""
    var password: String = ""
    
    
    var firstName: String = ""
    var secondName: String = ""
    var newMail : String = ""
    var newPW : String = ""
    
    
    init() {
        auth.delegate = self
    }
    func singOut() {
        auth.signOut()
    }
    
    func signIn() {
        auth.signIn(email, password)
    }
    
    
    func signUp() {
        auth.signUp(firstName, secondName, newMail, newPW)
    }
    
}


extension LoginVM: LoginManagerDelegate {
    func authStateDidChange(isLoggedIn: Bool) {
        loginStatus = isLoggedIn ? .loggedIn : .loggedOut
    }
}
