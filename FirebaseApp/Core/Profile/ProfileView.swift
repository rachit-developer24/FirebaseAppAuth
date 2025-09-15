//
//  ProfileView.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import SwiftUI
struct ProfileView: View {
    @Environment(AuthViewModel.self) var ViewModel
    var body: some View {
        if let user = ViewModel.currentUser{
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .frame(width:75, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text(user.fullname)
                                .fontWeight(.bold)
                            Text(user.email)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                    
                    
                }
                
                Section("General"){
                    RowViewComponent(image: Image(systemName: "gear"), title: "Version", version:"1.0.0", tintColor: Color(.systemGray))
                }
                Section("Account"){
                    Button {
                        ViewModel.signout()
                    } label: {
                        RowViewComponent(image: Image(systemName: "arrow.left.circle.fill"), title: "Sign Out",tintColor:.red)
                    }
                    
                    Button {
                        print("Delete Account")
                    } label: {
                        RowViewComponent(image: Image(systemName: "xmark.circle.fill"), title: "Delete Account", tintColor: .red)
                    }
                    
                }
            }
        }else{ProgressView()
                .task {
                    await ViewModel.fetchUser()
                }
        }
    }
}
#Preview {
    ProfileView()
        .environment(AuthViewModel())
}
