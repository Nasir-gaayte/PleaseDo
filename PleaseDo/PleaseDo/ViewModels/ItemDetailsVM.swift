//
//  ItemDetailsVM.swift
//  PleaseDo
//
//  Created by nasir on 27/10/25.
//

import Foundation
import Observation

@Observable
final class ItemDetailsVM {
    var initialItem = Item.empty()
    var updateItem = Item.empty()
    var didUpdateItem = false
    var updateItemError = false
    
    
    
    func updateItemFunc(){
        Task {
            do {
               
                try await IM.shared.saveItem(updateItem)
                DispatchQueue.main.async { [weak self] in self?.didUpdateItem = true}
                
            }catch {
                DispatchQueue.main.async { [weak self] in self?.didUpdateItem = true}
            }
        }
    }
}
