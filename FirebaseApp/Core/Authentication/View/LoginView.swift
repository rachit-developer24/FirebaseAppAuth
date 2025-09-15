//
//  LoginView.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthViewModel.self)var ViewModel
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack {
            Image("firebase-logo")
                .resizable()
                .frame(width: 130, height: 130)
                .padding(.vertical,20)
            
            VStack (spacing:12){
                VStack(spacing:18){
                    InuputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    InuputView(text: $password, title: "Password", placeholder: "Enter your Password", securefield: true)
                    VStack{
                        Text("Forgot Password?")
                            .foregroundStyle(.blue)
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.horizontal)
                Button {
                    Task{ try await  ViewModel.signin(with: email, password: password)}
                } label: {
                    Text("Sign in ")
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.vertical)
                .disabled(!Validataion)
                .opacity(Validataion ? 1 : 0.5)

                
            }
            Spacer()
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                    Text("dont have an account? Sign Up")
            }


        }
        
    }
}
extension LoginView:Autenticationformprotocol{
    var Validataion: Bool {
        return !email.isEmpty
        && !password.isEmpty
        && email.contains("@")
        && password.count > 6
    }
    
    
}

#Preview {
    LoginView()
        .environment(AuthViewModel())
}
