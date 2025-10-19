//
//  SignupView.swift
//  PleaseDo
//
//  Created by nasir on 19/10/25.
//

import SwiftUI

struct SignupView: View {
    @State var vm:LoginVM = LoginVM()
    @Binding var email:String
     @Binding var password:String
    @Binding var firstName:String
    @Binding var secondName:String
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
                .shadow(color: .gray, radius:4.5,x:1,y:2.5)
                .padding()
                .keyboardType(.default)
            TextField( "\(Image(systemName: "person.fill")) Second Name", text: $secondName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius:4.5,x:1,y:2.5)
                .padding()
                .keyboardType(.default)
            TextField( "\(Image(systemName: "mail")) Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius:4.5,x:1,y:2.5)
                .padding()
                .keyboardType(.default)
            
            SecureField("\(Image(systemName: "lock.fill")) Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: .gray, radius:4.5,x:1,y:2.5)
                .padding()
                .keyboardType(.default)
            
            ButtonLogView(title:"SignUp") {
                vm.signUp()
            }
            Spacer()
            
            HStack{
                Text("If you already have an account?")
                NavigationLink("Login"){
                    LoginView(email: $vm.email, password:$vm.password)
                }
            }
        }
    }
}

#Preview {
    SignupView(email: .constant(""), password: .constant(""), firstName: .constant(""), secondName: .constant(""))
}
