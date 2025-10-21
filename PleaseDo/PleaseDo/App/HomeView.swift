import SwiftUI

struct HomeView: View {
    @State private var vm  = ListVM()
    @State var lvm = LoginVM()
    @State private var path:[NavPath] = []
    
    // Add this to control when the dialog appears
    @State private var showLogoutDialog = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background.ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $vm.todoItem)
                    ListView(title: "In Progress", items: $vm.inProgressItem)
                    ListView(title: "Done", items: $vm.doneItem)
                }
                .tabViewStyle(.page)
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showLogoutDialog = true   // manually trigger dialog
                    } label: {
                        Image(systemName: "person.crop.circle")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        path.append(NavPath.newItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            // 👇 Confirmation dialog using Boolean
            .confirmationDialog("Continue Signing Out?", isPresented: $showLogoutDialog) {
                Button("Confirm", role: .destructive) {
                    LoginManager().signOut()
                    lvm.loginStatus = .loggedOut

                    // Delay to next frame to avoid multiple updates per frame
                    DispatchQueue.main.async {
                        path = [.login]
                    }
                }
                Button("Cancel", role: .cancel) {}
            }
            
            // 👇 Respond to changes in loginStatus
            .onChange(of: lvm.loginStatus) { oldValue, newValue in
                if newValue == .loggedOut {
                    showLogoutDialog = true
                }
            }
            
            .navigationDestination(for: NavPath.self) { path in
                switch path {
                case .newItem:
                    NewItemView()
                case .details(let item):
                    ItemDetailsView(item: item)
                case .login:
                    LoginView(email: $lvm.email, password: $lvm.password)
                case .signup:
                    SignupView(
                        newMail: $lvm.newMail,
                        newPW: $lvm.newPW,
                        firstName: $lvm.firstName,
                        secondName: $lvm.secondName
                    )
                case .loginPage:
                    LogedPageView()
                }
            }
        }
    }
}
