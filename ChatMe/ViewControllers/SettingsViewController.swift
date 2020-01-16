//
//  SettingsViewController.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/18/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    private let navBar: NavBar = {
        let bar = NavBar(frame: .zero)
        bar.profileButton.setTitle("", for: .normal)
        bar.profileButton.setImage(#imageLiteral(resourceName: "messageIcon"), for: .normal)
        bar.settingsButton.setImage(nil, for: .normal)
        bar.profileButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    private let tempButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let firebaseModel: FirebaseModel = {
        let model = FirebaseModel()
        return model
    }()
    private let helper: ConstraintHelper = {
        let helper = ConstraintHelper()
        return helper
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tempButton)
        setUpTempButton()
        view.addSubview(navBar)
        helper.setUpNavBar(navBar: navBar, parentView: view)
        navBar.profileButton.addTarget(self, action: #selector(toMessageBoard), for: .touchUpInside)
    }
    private func setUpTempButton(){
        tempButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tempButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        tempButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/5).isActive = true
        tempButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }
    
    /**
     A target method that will logout a user using firebase authentication.
     */
    @objc private func logout(){
        firebaseModel.logout(navigator: self.navigationController!)
    }
    @objc private func toMessageBoard(){
        navigationController?.popViewController(animated: false)
    }
    

}
