//
//  ViewController.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/12/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    private let messageView: MessageView = {
       let view = MessageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(messageView)
//        helper.setUpCenterConstraints(view: messageView, x: view.centerXAnchor, y: view.centerYAnchor, width: view.widthAnchor, widthMult: 1/1.1, heightMult: 1/1.3, height: view.heightAnchor)
        setUpView()
    }
    private func setUpView(){
        
        messageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        messageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/1.3).isActive = true
        messageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.1).isActive = true
    }
    
    
    


}

