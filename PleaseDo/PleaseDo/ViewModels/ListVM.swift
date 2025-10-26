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
        if todoItem.isEmpty && inProgressItem.isEmpty && doneItem.isEmpty {
            IM.shared.fetchItems()
        }
        
    }
}


extension ListVM : ItemManagerDelegate {
    func didFetchBatchItems(_ items: [Status:[Item]]){
        DispatchQueue.main.async{ [weak self] in
            guard let self else {return}
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
        
    }
    func didAddItem(_ item: Item){
        DispatchQueue.main.async{ [weak self] in
            guard let self else {return}
            switch item.status {
            case .todo:
                todoItem.append(item)
            case .inProgress:
               inProgressItem.append(item)
            case .done:
                doneItem.append(item)
            case .unowned:
                break
            }
        }
    }
    func didUpdateItem(_ item: Item){
        DispatchQueue.main.async{ [weak self] in
            guard let self else {return}
            if let i = todoItem.firstIndex(of: item){
                if todoItem[i].status == item.status{
                    todoItem[i] = item
                }else {
                    todoItem.remove(at: i)
                    didAddItem(item)
                }
            } else if let i = inProgressItem.firstIndex(of: item){
                if inProgressItem[i] == item{
                    inProgressItem[i] = item
                }else{
                    inProgressItem.remove(at: i)
                    didAddItem(item)
                }
            } else if let i = doneItem.firstIndex(of: item){
                if doneItem[i].status == item.status{
                    doneItem[i] = item
                }else {
                    doneItem.remove(at: i)
                    didAddItem(item)
                }
            }
        }
    }
    
    
    func didDeleteItem(_ item: Item){
        DispatchQueue.main.async{ [weak self] in
            guard let self else {return}
            switch item.status {
            case .todo:
                if let i = todoItem.firstIndex(of: item){
                    todoItem.remove(at: i)
                }
            case .inProgress:
               if let i = inProgressItem.firstIndex(of: item){
                    inProgressItem.remove(at: i)
                }
            case .done:
                if let i = doneItem.firstIndex(of: item){
                    doneItem.remove(at: i)
                }
            case .unowned:
                break
            }
        }
    }
}
