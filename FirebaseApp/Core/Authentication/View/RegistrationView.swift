//
//  RegistrationView.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(AuthViewModel.self)var viewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var fullName: String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Image("firebase-logo")
                .resizable()
                .frame(width: 130, height: 130)
                .padding(.vertical,20)
            
            VStack(spacing:22){
                InuputView(text: $email, title: "Email Address", placeholder: "Enter your email")
                    .textInputAutocapitalization(.never)
                InuputView(text: $fullName, title: "Full Name", placeholder: "Enter your full Name")
                InuputView(text: $password, title: "Password", placeholder: "Enter Your Password", securefield: true)
                ZStack(alignment:.trailing){
                InuputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your Password", securefield: true)
                if !confirmPassword.isEmpty && !password.isEmpty{
                    if password == confirmPassword {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(.green)
                    }else{
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(.red)
                    }
                            
                    }
                }
            }
            .padding(.horizontal)
            Button {
                Task{
                    
                        try await viewModel.createUser(with: email, password: password, fullname: fullName)
                           
                }
            } label: {
                Text("Sign in ")
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 50)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical,19)
            .disabled(!Validataion)
            .opacity(Validataion ? 1 : 0.5)

            Spacer()
            Button {
                dismiss()
            } label: {
                Text("Already have an account? Sign in")
                    
            }

        }
    }
}
extension RegistrationView:Autenticationformprotocol {
    var Validataion: Bool {
        return !email.isEmpty
        && !password.isEmpty
        && email.contains("@")
        && password.count > 6
    }
    
    
}
#Preview {
    RegistrationView()
        .environment(AuthViewModel())
}
