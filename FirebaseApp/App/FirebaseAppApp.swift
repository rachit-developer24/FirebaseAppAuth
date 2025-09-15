//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import SwiftUI
import Firebase

@main
struct FirebaseAppApp: App {
    @State var ViewModel:AuthViewModel
    init(){
        FirebaseApp.configure()
        _ViewModel = State(initialValue: AuthViewModel())
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ViewModel)
        }
    }
}
