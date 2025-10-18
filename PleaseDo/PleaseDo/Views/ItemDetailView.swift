//
//  ItemDetailView.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI

struct ItemDetailView: View {
    
    let item:Item
    var body: some View {
        VStack {
            Text(item.title)
                .font(.largeTitle)
                .padding()
            Text(item.description)
                .padding()
            Text("Status: \(item.status.rawValue)")
                .padding()
            Text("Priority: \(item.priority.rawValue)")
                .padding()
        }
    }
}

#Preview {
    ItemDetailView(item: Item(id: "1", authorId: "nasir", title: "test To Do", description: "this is a test todo descriptions  ",status: .done, priority: .low) )
}
