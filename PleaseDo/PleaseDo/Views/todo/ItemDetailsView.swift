//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI
import Foundation

struct ItemDetailsView: View {
    let item: Item
    
    @State private var titleKey = ""
       @State private var description = ""
       @State private var selectedStatus: Status = .todo
       @State private var selectedPriority: Priority = .medium
    
    var body: some View {
        
        VStack(spacing:10){
            ZStack{
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(.blue)
                    .cornerRadius(20)
                    .padding(.vertical,30)
            }.frame(maxHeight:200)
            
           
            TitleTextField(title: "Title:-", placeholder: "Enter your Title", description: titleKey)
            TitleTextField(title: "Description:-", placeholder: "Enter your Description", description: description)
                .padding(.vertical,30)
            Divider()
                            // Status picker
            VStack(alignment:.leading){
                Text("Status:-")
                Picker("Select Status", selection: $selectedStatus) {
                    ForEach([Status.todo, .inProgress, .done, .unowned], id: \.self) { status in
                                        Text(status.rawValue)
                                            .tag(status)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.horizontal)
                            }.padding(10)
        Divider()
        VStack(alignment:.leading){
                                Text("Priority:-")
                                // Priority picker
                                Picker("Select Priority", selection: $selectedPriority) {
                                    ForEach([Priority.low, .medium, .high], id: \.self) { priority in
                                        Text(priority.rawValue.capitalized)
                                            .tag(priority)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding(.horizontal)
                            }.padding(10)
                        }
                        
                       
                        CTAButton(title: "save") {
                            print("Item saved: \(titleKey)")
                            titleKey = ""
                            description = ""
                            selectedStatus = .todo
                           selectedPriority = .low
                            
                        }
            
            
        }
       
}


#Preview {
    ItemDetailsView(item:Item(id: "1", authorId: "1", title: "the one", description: "the first detail ietm for my todo", startDate: .now, status: .inProgress, priority: .high))
}
