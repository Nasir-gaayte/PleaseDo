//
//  SignupView.swift
//  PleaseDo
//
//  Created by nasir on 19/10/25.
//

import SwiftUI

struct SignupView: View {
    
    @State var email:String = ""
     @State var passText:String = ""
    @State var firstName:String = ""
    @State var secondName:String = ""
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
            TextField( "\(Image(systemName: "person.fill")) First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField( "\(Image(systemName: "person.fill")) Second Name", text: $secondName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField( "\(Image(systemName: "mail")) Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            SecureField("\(Image(systemName: "lock.fill")) Password", text: $passText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            ButtonLogView(title:"SignUp") {
                print("hala")
            }
            Spacer()
            
            HStack{
                Text("If you already have an account?")
                NavigationLink("Login"){
                    LoginView()
                }
            }
        }
    }
}

#Preview {
    SignupView()
}
