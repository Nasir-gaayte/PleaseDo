//
//  NewItemVM.swift
//  PleaseDo
//
//  Created by nasir on 23/10/25.
//

import Foundation
import Observation

@Observable
final class NewItemVM {
    
    
    var newItem:Item = Item.empty()
    func saveNewItem(){
        IM.shared.saveItem(newItem)
    }
}
