//
//  NewItemView.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI

struct NewItemView: View {
   
    @State private var newIVM:NewItemVM = NewItemVM()
    @Binding var path:[NavPath]
   
    
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
                    Picker("Select Status", selection: $newIVM.newItem.status) {
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
                    Picker("Select Priority", selection: $newIVM.newItem.priority) {
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
            .alert("Alert", isPresented: $newIVM.saveItemError){
                Button("Dismiss", role: .cancel){}
            } message :{
                Text("Error saving New Item")
            }
            .alert("Sccess!", isPresented: $newIVM.didSaveItem){
                Button("Sccess!",role: .cancel){
                    path.removeLast()
                }
            } message: {
                Text("Saved New Item!")
            }

        }.navigationBarTitle("New Item")
            
    }
}

#Preview {
    NewItemView(path:.constant([]))
}
