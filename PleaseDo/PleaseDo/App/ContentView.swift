//
//  ContentView.swift
//  PleaseDo
//
//  Created by nasir on 14/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var vm = LoginVM()
    
    var body: some View {
        switch vm.loginStatus {
            case .loggedIn:
            HomeView()
            case .loggedOut:
            LoginView(email: $vm.email, password: $vm.password)
        case .unowned:
            Text("unknown error")
        
        }
    }
}

#Preview {
    ContentView()
}
