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
     var todoItem:[Item]=[Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low),
                                    Item(id: "2", authorId: "Hussein", title: "test To Do2", description: "this is a test todo descriptions  2",status: .todo, priority: .high),
                                    Item(id: "3", authorId: "Hasan", title: "test To Do3", description: "this is a test todo descriptions  3",status: .inProgress , priority: .medium),]
     var inProgressItem:[Item]=[Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low),
                                          Item(id: "2", authorId: "Hussein", title: "test To Do2", description: "this is a test todo descriptions  2",status: .todo, priority: .high),
                                          Item(id: "3", authorId: "Hasan", title: "test To Do3", description: "this is a test todo descriptions  3",status: .inProgress , priority: .medium),]
   var doneItem:[Item]=[Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low),
                                    Item(id: "2", authorId: "Hussein", title: "test To Do2", description: "this is a test todo descriptions  2",status: .todo, priority: .high),
                                    Item(id: "3", authorId: "Hasan", title: "test To Do3", description: "this is a test todo descriptions  3",status: .inProgress , priority: .medium),]
//    @Published var unknownItem:[Item]=[]
    
    
}
