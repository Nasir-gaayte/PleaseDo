//
//  TitleTextField.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI

struct TitleTextField: View {
    
    @State var title: String
    @State var placeholder: String
    
    @State var description: String
    
    
    var body: some View {
        VStack(alignment:.leading,spacing: 2){
            Text("\(title)")
               .font(.caption2)
               .foregroundStyle(.secondary)
           TextField("\(placeholder)", text: $description,axis: .vertical)
        }.padding(10)
            .keyboardType(.default)
            .ignoresSafeArea()
    }
}

#Preview {
    TitleTextField(title: "todo1", placeholder:"Enter your task", description: "")
}
