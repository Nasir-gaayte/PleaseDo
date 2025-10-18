//
//  HomeView.swift
//  PleaseDo
//
//  Created by nasir on 14/10/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var vm  = ListVM()
    @State private var path:[NavPath] = []
    @State private var showLogout:Bool = false
   
    var body: some View {
        NavigationStack(path: $path){
            ZStack  {
                Color.background
                    .ignoresSafeArea()
                
                
                TabView {
                    ListView(title: "To Do", items: $vm.todoItem)
                    ListView(title: "In Progress", items: $vm.inProgressItem)
                    ListView(title: "Done", items: $vm.doneItem)
                          }
                          .tabViewStyle(.page)
            }
            
          
            .navigationBarTitleDisplayMode(.inline)
        
            .toolbar {
                // Left side (Leading)
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showLogout = true
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
            .confirmationDialog("Containue Signing Out?",isPresented: $showLogout) {
                Button("Confirm",role: .destructive){
                    print( "logout")
                }
                Button("Cancel",role: .close){
                    print( "cancel")
                }
                
            } message: {
                Text("Continue Signing Out?")
            }
        }
        
    }
}

#Preview {
    HomeView()
}
