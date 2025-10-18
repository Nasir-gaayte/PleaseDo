//
//  CTAButton.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI

struct CTAButton: View {
    
    let title:String
    let action: () -> Void
    
    
    
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                Text(title)
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
            }
        }.frame(maxHeight:65)
        
    }
//    func doSomething(completion: @escaping () -> Void){
//        
//    }
}

#Preview {
    CTAButton(title:"Hello" ){ }
}
