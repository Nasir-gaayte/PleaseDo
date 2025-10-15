//
//  ListView.swift
//  PleaseDo
//
//  Created by nasir on 15/10/25.
//

import SwiftUI

struct ListView: View {
    
    let title: String
    
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
               
            List {
                Text("item 1")
                Text("item 2")
                Text("item 3")
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To Do")
}
