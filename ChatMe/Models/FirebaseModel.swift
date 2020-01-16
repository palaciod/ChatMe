//
//  FirebaseModel.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/18/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import Kingfisher
struct FirebaseModel {
    static let database = Firestore.firestore()
    static let userID = Auth.auth().currentUser?.uid
    static let storeage = Storage.storage()
    static let email = Auth.auth().currentUser?.email
    static let storage = Storage.storage()
    /**
     A login method that uses a password method to authenticate users. If authenticated then the Navigation Controller will reset the the viewController array to an array with just the MessageBoard View Controller inside. This will release the Login Controller from memory.
     - parameters:
     - navigator: The UITextField that will be constrained within the textFieldContainer (UIView).
     - email: The NSLayoutAnchor that the topAnchor of the textField will be constrained to.
     - password: The NSLayout that the topAnchor of the lineSeperator (UIView) will be constrained to.
     
     */
    public func firebaseLogin(navigator: UINavigationController, email: String, password: String){
        if email.isEmpty || password.isEmpty {
            print("Must fill in required fields")
        }else{
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    print("Successful login")
                    navigator.setViewControllers([MessageBoard()], animated: true)
                }else{
                    print("Failed login")
                }
            }
        }
    }
    /**
      A login method that uses a password method to authenticate users. If authenticated then the Navigation Controller will reset the the viewController array to an array with just the MessageBoard View Controller inside. This will release the Login Controller from memory.
     A signout method that will reset the navigation controller with just the logn view controller within the array. This will cause the previouse view controller within navigator to be released from memory.
     */
    public func logout(navigator: UINavigationController){
        let auth = Auth.auth()
        if auth.currentUser != nil {
            do{
                try auth.signOut()
                print("Successfully logged out")
                navigator.setViewControllers([Login()], animated: true)
            }catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    /**
     A method to sign up to users. Successful registrations will set the navigator's view controllers to a single MessageBoard view controller. This will release the login view controller from memory.
     */
    public func registerNewUser(navigator: UINavigationController, email: String, password: String, secondPassword: String){
        if email.isEmpty || password.isEmpty || secondPassword.isEmpty{
            print("Must fill in required fields")
        }else if password != secondPassword{
            print("Password do not match!")
        }else{
            let auth = Auth.auth()
            auth.createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    print("Created an acount for \(email).")
                    self.createUser(tempName: self.getFirstPartOfEmail())
                    navigator.setViewControllers([MessageBoard()], animated: true)
                }else{
                    print("Failed to create account.")
                }
            }
        }
    }
    /**
     A method to check the sign in status of a user. Successful check ins will set the navigator's view controllers to a single MessageBoard view controller. This will release the login view controller from memory.
     */
    public func getUserSignInStatus(navigator: UINavigationController){
        let auth = Auth.auth()
        if let user = auth.currentUser{
            print("\(user.email!) is signed in")
            let messageBoardViewController = MessageBoard()
            messageBoardViewController.email = FirebaseModel.email
            navigator.setViewControllers([messageBoardViewController], animated: true)
        }else{
            print("User is not signed in")
        }
    }
    
    
    public func changeEmail(email: String){
        Auth.auth().currentUser?.updateEmail(to: email, completion: { (error) in
            if let error = error{
                print("Failed to update email -----> \(error)")
            }else{
                print("Successful email updaye!")
            }
        })
    }
    
    public func createUser(tempName: String){
        let document = ["name": tempName,"username": tempName, "phone": "", "gender": ""]
        FirebaseModel.database.collection("users").document(FirebaseModel.userID!).setData(document) { (error) in
            if let error = error{
                print("Failed to write to database <-----\(error)---->")
            }else{
                print("Success write to databse")
            }
        }
    }
    public func getFirstPartOfEmail() -> String{
        var newEmail = ""
        let email = FirebaseModel.email
        for index in email!{
            if index != "@"{
                newEmail.append(index)
            }else{
                break
            }
        }
        return newEmail
    }
    
    public func getUser(user: User){
        FirebaseModel.database.collection("users").document(FirebaseModel.userID!).getDocument { (document, error) in
            user.setName(_name: document?.data()?["name"] as! String)
            user.setUsername(_username: document?.data()?["username"] as! String)
            user.setPhone(_phone: document?.data()?["phone"] as! String)
            user.setGender(_gender: document?.data()?["gender"] as! String)
        }
    }
    
    public func updateUser(name: String, username: String, phone: String, gender: String){
        let updatedDoc = ["name": name,"username": username, "phone": phone, "gender": gender]
        FirebaseModel.database.collection("users").document(FirebaseModel.userID!).updateData(updatedDoc) { (error) in
            if let error = error {
                print("Failed to update user -------> \(error)")
            }else{
                print("Successful update")
            }
        }
    }
    
    public func uploadImage(image: UIImageView){
        let jpegData = image.image?.jpegData(compressionQuality: 0)
        let imageStorage = FirebaseModel.storage.reference().child("users").child(FirebaseModel.userID!).child("profilePicture")
        imageStorage.putData(jpegData!, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Failed to upload image")
                print(error.localizedDescription)
            }else{
                print("Successful Upload")
                
            }
        }
    }
    
    public func downloadImageUrl(user: User){
        let imageStorage = FirebaseModel.storage.reference().child("users").child(FirebaseModel.userID!).child("profilePicture")
        imageStorage.downloadURL { (url, error) in
            if let error = error {
                print("Failed to download image")
                print(error.localizedDescription)
            }else{
                print("Successful Download")
                user.setUrl(_url: url!)
            }
        }
    }
    
    
    
}
