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
    
    var currentUser:User?
    let db = Firestore.firestore()
    
    func signup(_ farstName:String, _ secondName:String, _ email:String ,_ password:String){
        Auth.auth().createUser(withEmail: email, password: password)  {[weak self] result, error in
            if let error {
                print(error)
                return
            }
            guard let self, let result else { return }
           currentUser = result.user
           let id = result.user.uid
            
            Task{ [weak self] in guard let self else { return }
                // Add a new document in collection "cities"
                           do {
                             try await db.collection("Users").document(id).setData([
                               "id": id,
                               "firstName": farstName,
                               "secondName": secondName,
                               "email": email
                             ])
                             print("Document successfully written!")
                           } catch {
                             print("Error writing document: \(error)")
                           }
            }
            
           
            
            
        }    }
}
