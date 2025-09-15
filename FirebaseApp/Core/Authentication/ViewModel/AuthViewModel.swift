//
//  AuthViewModel.swift
//  FirebaseApp
//
//  Created by Rachit Sharma on 09/09/2025.
//


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import Observation

protocol Autenticationformprotocol{
    var Validataion:Bool{get}}
@Observable
@MainActor
class AuthViewModel{
    var usersession:FirebaseAuth.User?
    var currentUser:User?
    
    init(){
        self.usersession = Auth.auth().currentUser
    }
    
    func signin(with email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.usersession = result.user
        await fetchUser()
    }
    
    func createUser(with email:String,password:String,fullname:String)async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.usersession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let Userencoded = try JSONEncoder().encode(user)
            guard let dct = try JSONSerialization.jsonObject(with: Userencoded) as? [String:Any] else {return}
            try await Firestore.firestore().collection("Users").document(user.id).setData(dct)
            await fetchUser()

        }catch{
            print("Debug : failed to create user \(error.localizedDescription)")
        }
    }
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            let snap  = try await Firestore.firestore().collection("Users").document(uid).getDocument()
            let dict  = snap.data() ?? [:]
            let data  = try JSONSerialization.data(withJSONObject: dict)
            currentUser = try JSONDecoder().decode(User.self, from: data)
        } catch {
            print("fetchUser:", error.localizedDescription)
        }
    }


    func signout(){
        do{
            try Auth.auth().signOut()
            self.usersession = nil
            self.currentUser = nil
        }catch{
            print("failed to signout\(error.localizedDescription)")
        }
    }
    
    func deleteaccount(){
        
    }
 
}
