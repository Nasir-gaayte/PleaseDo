//
//  LoginView.swift
//  PleaseDo
//
//  Created by nasir on 18/10/25.
//

import SwiftUI

struct LoginView: View {
    @State var vm: LoginVM = LoginVM()
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                HStack(spacing: 10) {
                    Image(.logo)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    VStack {
                        Text("Please Do")
                            .font(.largeTitle)
                            .bold()
                        Divider()
                        Text("A Better todo list")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(10)
                }
                .padding(10)
                
                TextField("\(Image(systemName: "person.fill")) Username", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: .gray, radius: 4.5, x: 1, y: 2.5)
                    .padding()
                
                SecureField("\(Image(systemName: "lock.fill")) Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: .gray, radius: 4.5, x: 1, y: 2.5)
                    .padding()
                
                ButtonLogView(title: "Login") {
                    vm.email = email
                    vm.password = password
                    vm.signIn()
                }
                
                Spacer()
                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink("Sign up") {
                        SignupView(
                            newMail: $vm.newMail,
                            newPW: $vm.newPW,
                            firstName: $vm.firstName,
                            secondName: $vm.secondName
                        )
                    }
                }
            }
            .navigationTitle("Login")
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView(email: .constant(""), password:.constant(""))
}
