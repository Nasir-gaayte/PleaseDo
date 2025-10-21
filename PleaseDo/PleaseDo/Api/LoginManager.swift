//
//  LoginManager.swift
//  PleaseDo
//
//  Created by nasir on 19/10/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


final class LoginManager {
    
    
    let db = Firestore.firestore()
    var handler:AuthStateDidChangeListenerHandle?
    let auth = Auth.auth()
    
    private(set) var currentUser: User?
    
    
    init()
    {
        setupListener()
    }
    
    deinit {
        removerListener()
    }
    
    
    
    func signUp(_ firesName: String, _ secondName: String, _ email: String, _ newPW: String) {
            Task {
                do {
                    let result = try await auth.createUser(withEmail: email, password: newPW)
                    let id = result.user.uid
                    let db = Firestore.firestore()
                    let users = db.collection("Users")
                    try await users.document(id).setData([
                        "firesName": firesName,
                        "secondName": secondName,
                        "email": email
                    ])
                    currentUser = result.user
                    print("Successfully created user!")
                } catch {
                    print(error)
                }
            }
        }
    
    func signOut(){
        
        do{
            try Auth.auth().signOut()
            currentUser = nil
            removerListener()
            print("Successfully signed out!")
        } catch {
            print(error)
        }
        
        
    }
    
    
    
    
    func setupListener(){
        guard handler == nil else { return }
        handler = Auth.auth().addStateDidChangeListener { [weak self ] auth, user in
            guard let self else { return }
            currentUser = auth.currentUser
            
        }
    }
    
    
    func removerListener(){
        if let h = handler {
            Auth.auth().removeStateDidChangeListener(h)
        }
    }
    
    
    
    
    
    
}
