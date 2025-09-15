//
//  User.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 07/09/2025.
//

import Foundation
struct User:Codable,Identifiable{
    var id :String
    var fullname:String
    var email:String
    
    var initials:String{
        let Formatter = PersonNameComponentsFormatter()
        if let components = Formatter.personNameComponents(from: fullname){
            Formatter.style = .abbreviated
            return Formatter.string(from: components)
        }
        return ""
    }
}
extension User{
    static var sampleData = User(id: UUID().uuidString, fullname: "Rachit Sharma", email: "rachit@gmail.com")
}
