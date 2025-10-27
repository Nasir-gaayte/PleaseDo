//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI
import Foundation

struct ItemDetailsView: View {
    @Binding var path:[NavPath]
    let item: Item
    @State var dVM = ItemDetailsVM()
    @State var newVM = NewItemVM()
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
            
            
            TitleTextField(title: "Title:-", placeholder: "Enter your Title", description: dVM.updateItem.title)
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
            
            if dVM.initialItem.isDifferent(comparedTo: dVM.updateItem){
                CTAButton(title: "save") {
                    dVM.updateItemFunc()
                    
                    
                }.alert("Alert", isPresented: $dVM.updateItemError){
                    Button("Dismiss", role: .cancel){}
                } message :{
                    Text("Error Updating Item")
                }
                .alert("Sccess!", isPresented: $dVM.didUpdateItem){
                    Button("Sccess!",role: .cancel){}
                } message: {
                    Text("Saved Updat Item!")
                }
            }
        }.padding()
            .navigationTitle("Details")
            .onAppear {
                dVM.initialItem = item
                dVM.updateItem = item
            }
            
            
        }
       
}


#Preview {
    ItemDetailsView(path: .constant([]), item:Item(id: "1", authorId: "1", title: "the one", description: "the first detail ietm for my todo", startDate: .now, status: .inProgress, priority: .high))
}
