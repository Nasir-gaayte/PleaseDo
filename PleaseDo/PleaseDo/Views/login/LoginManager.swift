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
    let auth = Auth.auth()
    
    private(set) var currentUser: User? 
    
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
}
