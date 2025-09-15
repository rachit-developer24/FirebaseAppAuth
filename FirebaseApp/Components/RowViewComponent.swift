//
//  RowViewComponent.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import SwiftUI

struct RowViewComponent: View {
    var image:Image
    var title:String
    var version:String?
    var tintColor:Color
    var body: some View {
        HStack{
            image
            .foregroundStyle(tintColor)
            Text(title)
                .accentColor(.black)
            Spacer()
            if let version = version{
                Text(version)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    RowViewComponent( image: Image(systemName: "gear"), title: "signout" , version: "", tintColor: .red)
}
