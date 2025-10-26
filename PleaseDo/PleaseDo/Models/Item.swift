//
//  Item.swift
//  PleaseDo
//
//  Created by nasir on 15/10/25.
//

import Foundation
import FirebaseCore

struct Item :Identifiable , Equatable, Hashable{
    var id : String
    var authorId: String
    var title: String
    var description: String
    var startDate: Date = .now
    var status: Status
    var priority: Priority
    
    static func == (lhs: Item, rhs: Item) -> Bool {
       return lhs.id == rhs.id
    }
    
    init(data:[String:Any]){
     
        
        self.id = data["id"] as? String ?? UUID().uuidString
        authorId = data["authorId"] as! String
        self.title = data["title"] as? String ?? "Untitled"
            
        description = data["description"] as! String
        
        let timestamp = data["startDate"] as! Timestamp
        startDate = timestamp.dateValue()
        
        
        let strStatus = data["status"] as! String
        status = Status(strStatus)
        
        
        let priorityStr = data["priority"] as! String
        priority = Priority(priorityStr)
    }
    
    init(id: String, authorId: String, title: String, description: String, startDate: Date, status: Status, priority: Priority) {
        self.id = id
        self.authorId = authorId
        self.title = title
        self.description = description
        self.startDate = startDate
        self.status = status
        self.priority = priority
        
    }
    static func empty() -> Item {
        return Item(id: UUID().uuidString, authorId: "", title: "", description: "", startDate: .now, status: .unowned, priority: .unowned)
    }
    
    func toObject() -> [String:Any] {
        var data: [String:Any] = [:]
        data["id"] = id
        data["authorId"] = authorId
        data["title"] = title
        data["description"] = description
        data["startDate"] = Timestamp(date: startDate)
        data["status"] = status.rawValue
        data["priority"] = priority.rawValue
        return data
    }
    
    
}

enum Status: String {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
    case unowned = "Unowned"
    
    
    init(_ str: String){
        self = switch str.lowercased() {
        case "todo":  .todo
        case "in progress": .inProgress
        case "done": .done
        default:  .unowned
        }
    }
}



enum Priority: String, Codable{
    case low
    case medium
    case high
    case unowned
    
    
    init(_ str: String){
        self = switch str.lowercased() {
        case "low":  .low
        case "medium": .medium
        case "high": .high
        default:  .unowned
        }
    }
    
}
