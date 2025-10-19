//
//  ButtonLogView.swift
//  PleaseDo
//
//  Created by nasir on 19/10/25.
//

import SwiftUI

struct ButtonLogView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action:action){
            HStack{
                Text(title)
                    .font(.title)
                    .padding()
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [.lightGray, .white]), startPoint: .leading, endPoint: .trailing))
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:30,maxHeight:30)
                    .padding(.trailing)
                    .foregroundStyle(.white)
                
                    
            }
        }
        .background( LinearGradient(gradient: Gradient(colors: [.blue, .lightBlue]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
    }
}

#Preview {
    ButtonLogView(title: "login"){}
}
