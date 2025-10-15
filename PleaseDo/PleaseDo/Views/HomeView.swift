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
                Text("page1")
                Text("page2")
                Text("page3")
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
