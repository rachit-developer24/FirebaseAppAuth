//
//  InuputView.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import SwiftUI

struct InuputView: View {
    @Binding var text: String
    var title:String
    var placeholder:String
    var securefield:Bool = false
    var body: some View {
        VStack(alignment: .leading){
            if securefield{
                Text(title)
                    .fontWeight(.semibold)
                SecureField(placeholder, text: $text)
            }else{
                Text(title)
                    .fontWeight(.semibold)
                TextField(placeholder, text: $text)
            }
            Divider()
        }
    }
}

#Preview {
    InuputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
