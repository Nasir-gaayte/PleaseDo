//
//  ItemManager.swift
//  PleaseDo
//
//  Created by nasir on 22/10/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


protocol ItemManagerDelegate where Self: ListVM {
    func didFetchBatchItems(_ items: [Status: [Item]])
    func didAddItem(_ item: Item)
    func didUpdateItem(_ item: Item)
    func didDeleteItem(_ item: Item)
}



typealias IM = ItemManager
final class ItemManager {
    
    weak var delegate: ItemManagerDelegate?
    static let shared = ItemManager()
    private init() {}
    private let db = Firestore.firestore()
    
    private var isInitialFatch = true
    
    private var allItems: [Status:[String:Item]] = [
        .todo: [:],
        .inProgress: [:],
        .done: [:]
    ]
    
    func addItem(_ item: Item) {
        
    }
    
    func fetchItems()  {
        guard let currentUser = Auth.auth().currentUser else { return }
        let id = currentUser.uid
        
        db.collection("Items").whereField("authorId", isEqualTo: id)
          .addSnapshotListener { [weak self] snapshot, err in
              
              if let err {
                  print("Error fetching documents: \(err)")
              }
              
              guard let self, let snapshot else { return }
              
              snapshot.documentChanges.forEach { [weak self] c in
                 guard let self else { return }
                  let data = c.document.data()
                  let item = Item(data: data)
                  switch c.type {
                  case .added:
                      if isInitialFatch{
                          allItems[item.status]?[item.id] = item
                          
                      }else{
                          
                          delegate?.didAddItem(item)
                      }
                      
                  case .modified:
                      delegate?.didUpdateItem(item)
                  case .removed:
                      delegate?.didDeleteItem(item)
                      
                  }
              }
              guard isInitialFatch else { return }
              sortBatchItems()
              isInitialFatch = false
          }
    }
    
    private func sortBatchItems(){
        var sortedItems: [Status:[Item]] = [:]
        allItems.keys.forEach { status in
            sortedItems[status] = allItems[status]?.values.sorted(by: {
                $0.startDate > $1.startDate
            })
        }
        delegate?.didFetchBatchItems(sortedItems)
    }
    
    func saveItem(_ item: Item) async throws {
        // Add a new document in collection "cities"
        do {
            try await db.collection("Items").document(item.id).setData(item.toObject())
          print("Document successfully written!")
        } catch {
          print("Error writing document: \(error)")
            throw error
        }
    }
}

