//
//  NewItemVM.swift
//  PleaseDo
//
//  Created by nasir on 23/10/25.
//

import Foundation
import Observation
import FirebaseAuth

@Observable
final class NewItemVM {
    
    var saveItemError = false
    var didSaveItem = false
    var newItem:Item = Item.empty()
    
    init(){
        guard let user = Auth.auth().currentUser else {
            return
        }
        
        newItem = Item(
            id: UUID().uuidString,
            authorId: user.uid,
            title: "",
            description: "",
            startDate: .now,
            status: .todo,
            priority: .low
        )
    }
    
    func saveNewItem(){
        Task {
            do {
               
                try await IM.shared.saveItem(newItem)
                DispatchQueue.main.async { [weak self] in self?.didSaveItem = true}
                
            }catch {
                DispatchQueue.main.async { [weak self] in self?.saveItemError = true}
            }
        }
        
        
        
    }
}
