//
//  HomeView.swift
//  PleaseDo
//
//  Created by nasir on 14/10/25.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var path:[NavPath] = []
    @State private var todo :[Item]=[
        
        Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low),
        Item(id: "2", authorId: "Hussein", title: "test To Do2", description: "this is a test todo descriptions  2",status: .todo, priority: .high),
        Item(id: "3", authorId: "Hasan", title: "test To Do3", description: "this is a test todo descriptions  3",status: .inProgress , priority: .medium),
    ]
    
    @State private var progress :[Item]=[
        
        Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low),
        Item(id: "2", authorId: "Hussein", title: "test To Do2", description: "this is a test todo descriptions  2",status: .todo, priority: .high),
        Item(id: "3", authorId: "Hasan", title: "test To Do3", description: "this is a test todo descriptions  3",status: .inProgress , priority: .medium),
    ]
    
    @State private var done :[Item]=[
        
        Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low),
        Item(id: "2", authorId: "Hussein", title: "test To Do2", description: "this is a test todo descriptions  2",status: .todo, priority: .high),
        Item(id: "3", authorId: "Hasan", title: "test To Do3", description: "this is a test todo descriptions  3",status: .inProgress , priority: .medium),
    ]
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack  {
                Color.background
                    .ignoresSafeArea()
                
                
                TabView {
                              ListView(title: "To Do", items: $todo)
                              ListView(title: "In Progress", items: $progress)
                              ListView(title: "Done", items: $done)
                          }
                          .tabViewStyle(.page)
            }
            
          
            .navigationBarTitleDisplayMode(.inline)
        
            .toolbar {
                // Left side (Leading)
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("logout")
                    } label: {
                        Image(systemName: "person.crop.circle")
                    }
                }

                // Right side (Trailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(NavPath.newItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: NavPath.self
            ) { path in
                switch path {
                case .newItem:
                    NewItemView()
                case .details(let item):
                    ItemDetailView(item: item)
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
