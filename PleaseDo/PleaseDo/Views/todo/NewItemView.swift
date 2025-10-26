//
//  NewItemView.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI

struct NewItemView: View {

//    @State private var titleKey = ""
//       @State private var description = ""
//       @State private var selectedStatus: Status = .todo
//       @State private var selectedPriority: Priority = .medium
    @State private var newIVM:NewItemVM = NewItemVM()

    var body: some View {
        VStack{
           Spacer()
            VStack(alignment: .leading){
                TitleTextField(title: "Title:-", placeholder: "Enter your Title", description: newIVM.newItem.title )
                TitleTextField(title: "Description:-", placeholder: "Enter your Description", description: newIVM.newItem.description)
                    
Divider()
                // Status picker
                VStack(alignment:.leading){
                    Text("Status:-")
                    Picker("Select Status", selection: newIVM.newItem.status) {
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
                    Picker("Select Priority", selection: newIVM.newItem.priority) {
                        ForEach([Priority.low, .medium, .high], id: \.self) { priority in
                            Text(priority.rawValue.capitalized)
                                .tag(priority)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                }.padding(10)
            }
            
            Spacer()
            CTAButton(title: "save") {
                newIVM.saveNewItem()
                
                
            }
//            Button("Save") {
//                            print("Item saved: \(titleKey)")
//                    titleKey = ""
//                    description = ""
//                    selectedStatus = .todo
//                   selectedPriority = .low
//                        }
//                        .buttonStyle(.borderedProminent)
//                        .padding()
                        
                       

        }.navigationBarTitle("New Item")
            
    }
}

#Preview {
    NewItemView()
}
