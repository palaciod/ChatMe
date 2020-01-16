//
//  User.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/22/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
class User {
    private var name: String?
    private var email: String?
    private var username: String?
    private var phone: String?
    private var gender: String?
    private var url: URL?
    private let firebaseModel: FirebaseModel = {
        let model = FirebaseModel()
        return model
    }()
    
    init() {
        email = FirebaseModel.email
        firebaseModel.getUser(user: self)
        firebaseModel.downloadImageUrl(user: self)
    }
    public func setName(_name: String){
        name = _name
    }
    public func getName() -> String?{
        return name
    }
    public func setUsername(_username: String){
        username = _username
    }
    public func getUsername() -> String?{
        return username
    }
    public func setPhone(_phone: String){
        phone = _phone
    }
    public func getPhone() -> String?{
        return phone
    }
    public func setGender(_gender: String){
        gender = _gender
    }
    public func getGender() -> String?{
        return gender
    }
    
    public func setUrl(_url: URL){
        url = _url
    }
    public func getUrl() -> URL?{
        return url
    }
    
    
    public func setEmail(_email: String){
        firebaseModel.changeEmail(email: _email)
        email = _email
    }
    public func getEmail() -> String?{
        return email
    }
   
}
