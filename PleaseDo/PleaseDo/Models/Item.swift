//
//  Item.swift
//  PleaseDo
//
//  Created by nasir on 15/10/25.
//

import Foundation

struct Item :Identifiable {
    var id : String
    var authorId: String
    var title: String
    var description: String
    var startDate: Date = .now
    var status: Status
    var priority: Priority
    
    
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
//    case unowned
    
//    
//    init(_ str: String){
//        self = switch str.lowercased() {
//        case "low":  .low
//        case "medium": .medium
//        case "high": .high
//        default:  .unowned
//        }
//    }
    
}
