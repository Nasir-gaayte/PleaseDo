//
//  LogedPageView.swift
//  PleaseDo
//
//  Created by nasir on 19/10/25.
//

import SwiftUI

struct LogedPageView: View {
    
    @State var vm = LoginVM()
    
    var body: some View {
        VStack {
            
            
            if vm.isLoggingIn  {
                Text("loggedIn")
            }else {
              
                LoginView(userName: $vm.username, password: $vm.password)
            }
        }
    }
}

#Preview {
    LogedPageView()
}
