//
//  ListVM.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import Foundation
import SwiftUI
import Observation


@Observable final class ListVM {
     var todoItem:[Item]=[]
     var inProgressItem:[Item]=[]
   var doneItem:[Item]=[]
    
    
    
    

    
    init(){
        IM.shared.delegate = self
    }
    
    
    
    func fetchItems(){
        IM.shared.fetchItems()
    }
}


extension ListVM : ItemManagerDelegate {
    func didFetchBatchItems(_ items: [Status:[Item]]){
        for status in items.keys{
            switch status {
            case .todo:
                todoItem = items[status]!
            case .inProgress:
                inProgressItem = items[status]!
            case .done:
                doneItem = items[status]!
            case .unowned:
                continue
            
            }
        }
    }
    func didAddItem(_ item: Item){}
    func didUpdateItem(_ item: Item){}
    func didDeleteItem(_ item: Item){}
}
