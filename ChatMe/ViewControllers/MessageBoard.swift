//
//  MessageBoard.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/17/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class MessageBoard: UIViewController {
    public var email: String?
    private let navBar: NavBar = {
        let bar = NavBar(frame: .zero)
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    private let messageView: MessageView = {
        let view = MessageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let user: User = {
        let user = User()
        return user
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navBar)
        view.addSubview(messageView)
        setUpNavBar()
        setUpMessageView()
        
        // Do any additional setup after loading the view.
    }
    
    /**
     Sets the top anchor constraint to the safe areea constraint of the parent view
     */
    private func setUpNavBar(){
        navBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        navBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        // Adding targets to navbar buttons
        navBar.settingsButton.addTarget(self, action: #selector(toSettings), for: .touchUpInside)
        navBar.profileButton.addTarget(self, action: #selector(toProfile), for: .touchUpInside)
    }
    /**
     Sets the top anchor constraint of messageView to the bottom anchor constraint to the navbar view
     */
    private func setUpMessageView(){
        messageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        messageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.95).isActive = true
        messageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
    }
    /**
     A target method that will push the settings view controller to the navigator stack.
     */
    @objc private func toSettings(){
        let settings = SettingsViewController()
        navigationController?.pushViewController(settings, animated: false)
    }
    /**
     A target method that will push the profile view controller to the navigator stack.
     */
    @objc private func toProfile(){
        let profilePage = ProfileViewController()
        profilePage.email = user.getEmail()
        profilePage.user = user
        navigationController?.pushViewController(profilePage, animated: false)
    }
    

}

    
