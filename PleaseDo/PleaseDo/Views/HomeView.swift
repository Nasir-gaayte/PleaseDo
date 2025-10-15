//
//  HomeView.swift
//  PleaseDo
//
//  Created by nasir on 14/10/25.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var path = NavigationPath()
    
    
    var body: some View {
        NavigationStack {
            TabView {
                ListView(title: "To Do")
                ListView(title: "In Progress")
                ListView(title: "Done")
              
            }
            .tabViewStyle(.page)
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
                        print("Navigate to new Item")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: String.self
            ) { _ in
                Text("New Item")
            }
        }
        
    }
}

#Preview {
    HomeView()
}
