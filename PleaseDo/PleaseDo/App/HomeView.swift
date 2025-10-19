//
//  HomeView.swift
//  PleaseDo
//
//  Created by nasir on 14/10/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var vm  = ListVM()
    @State var lvm = LoginVM()
    @State private var path:[NavPath] = []
    
   
    var body: some View {
        NavigationStack(path: $path){
            ZStack  {
                Color.background
                    .ignoresSafeArea()
                
                
                TabView {
                    ListView(title: "To Do", items: $vm.todoItem)
                    ListView(title: "In Progress", items: $vm.inProgressItem)
                    ListView(title: "Done", items: $vm.doneItem)
                          }
                          .tabViewStyle(.page)
            }
            
          
            .navigationBarTitleDisplayMode(.inline)
        
            .toolbar {
                // Left side (Leading)
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        $lvm.isLoggingIn.wrappedValue = true
                    } label: {
                        Image(systemName: "person.crop.circle")
                    }
                }

                // Right side (Trailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(NavPath.newItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: NavPath.self
            ) { path in
                switch path {
                case .newItem:
                    NewItemView()
                case .details(let item):
                    ItemDetailsView(item: item)
                case .login:
                    LoginView(email: $lvm.email, password: $lvm.password)
                case .signup:
                    SignupView(email: $lvm.email, password: $lvm.password, firstName: $lvm.firstName, secondName: $lvm.secondName,)
                case .loginPage:
                    LogedPageView()
                }
            }
            .confirmationDialog("Containue Signing Out?",isPresented: $lvm.isLoggingIn) {
                Button("Confirm",role: .destructive){
                    print( "logout")
                    path.append(NavPath.loginPage)
                }
                Button("Cancel",role: .close){
                    print( "cancel")
                }
                
            } message: {
                Text("Continue Signing Out?")
            }
        }
        
    }
}

#Preview {
    HomeView()
}
