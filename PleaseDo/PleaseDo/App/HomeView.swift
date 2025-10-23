import SwiftUI

struct HomeView: View {
    @State private var vm  = ListVM()
    @State var lvm = LoginVM()
    @State private var path:[NavPath] = []
    @State var mlvm = LoginManager()
    var confirm:String = ""
    
    // Add this to control when the dialog appears
    @State private var showLogoutDialog = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background.ignoresSafeArea()
                
                switch $lvm.loginStatus.wrappedValue {
                case .loggedIn:
                    TabView {
                        ListView(title: "To Do", items: $vm.todoItem)
                        ListView(title: "In Progress", items: $vm.inProgressItem)
                        ListView(title: "Done", items: $vm.doneItem)
                    }
                    .tabViewStyle(.page)
                case .loggedOut:
                    EmptyView()
                    .navigationBarTitle("To Do List")
                case .unowned:
                    Text("signup first")
                }
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
            .confirmationDialog("Account Options", isPresented: $showLogoutDialog) {
                if lvm.loginStatus == .loggedIn {
                    Button("Log Out", role: .destructive) {
                        mlvm.signOut()
                        lvm.loginStatus = .loggedOut

                        // Delay navigation slightly to avoid multiple updates
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            path = [.login]
                        }
                    }
                } else {
                    Button("Log In") {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            path = [.login]
                        }
                    }
                }

                Button("Cancel", role: .cancel) {}
            }
            
            // 👇 Respond to changes in loginStatus
            .onChange(of: lvm.loginStatus) { oldValue, newValue in
                if newValue == .loggedOut {
                    showLogoutDialog = false
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
        }.onAppear {
            vm.fetchItems()
        }
    }
}
