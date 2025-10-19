//
//  ListView.swift
//  PleaseDo
//
//  Created by nasir on 15/10/25.
//

import SwiftUI

struct ListView: View {
    
    let title: String
    @Binding var items :[Item]
    var body: some View {
        VStack(spacing: 0){
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight :32)
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.orange)
                        .overlay{
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white,lineWidth: 2)
                        }
                }
                .padding(.horizontal , 16)
                .padding(.top, 16)
               
            List($items) { $item in
                NavigationLink(value: NavPath.details(item)){
                    ListItemView(item: item, height: 100)
                }
                
                
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To Do", items: .constant([
        Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low),
        Item(id: "2", authorId: "Hussein", title: "test To Do2", description: "this is a test todo descriptions  2",status: .todo, priority: .high),
        Item(id: "3", authorId: "Hasan", title: "test To Do3", description: "this is a test todo descriptions  3",status: .inProgress , priority: .medium),
    ]
                                            ))
    
}
