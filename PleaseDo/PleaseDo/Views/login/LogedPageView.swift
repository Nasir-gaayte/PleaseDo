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
            
//            
//            if $vm.loginStatus  {
//                Text("loggedIn")
//            }else {
//              
//                LoginView(email: $vm.email, password: $vm.password)
//            }
        }
    }
}

#Preview {
    LogedPageView()
}
