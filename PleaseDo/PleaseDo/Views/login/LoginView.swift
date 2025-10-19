//
//  LoginView.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI

struct LoginView: View {
    
   @State var userText:String = ""
    @State var passText:String = ""
    @State private var path:[NavPath] = []
    
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack(spacing:10){
                Image(.logo)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                VStack{
                    Text("Please Do")
                        .font(Font.largeTitle)
                        .bold()
                Divider()
                    Text("A Better todo list")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }.padding(10)
            }.padding(10)
            TextField( "\(Image(systemName: "person.fill")) Username", text: $userText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("\(Image(systemName: "lock.fill")) Password", text: $passText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            ButtonLogView(title:"Login"){
                print("loged in")
                
            }
            
            Spacer()
            
            HStack{
                Text("Don't have an account?")
                NavigationLink("Sign up") {
                    SignupView()
                }

            }
        }.navigationTitle(Text("Login"))
    }
    
    
}

#Preview {
    LoginView()
}
