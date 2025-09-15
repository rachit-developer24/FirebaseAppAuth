//
//  ContentView.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthViewModel.self)var ViewModel
    var body: some View {
        Group{
            if ViewModel.usersession != nil{
                ProfileView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthViewModel())
        }
