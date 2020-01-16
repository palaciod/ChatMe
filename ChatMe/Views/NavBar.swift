//
//  NavBar.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/18/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class NavBar: UIView {
    public var screen: String = "main"
    /**
     A button that will take the user to the settings view controller
     */
    public let settingsButton: UIButton = {
        let button = UIButton(type: .custom)
       // button.setTitle("⚙️", for: .normal)
        button.setImage(#imageLiteral(resourceName: "gear"), for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    /**
     A button that will take the user to the profile view controller
     */
    public let profileButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("👤", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    /**
     The initializer for this class. Inherits from UIView.
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(profileButton)
        self.addSubview(settingsButton)
        setUpSettingsButton()
        setUpProfileButton()
    }
    /**
     Satisfying the compiler to assure it that if this class were to have any subclasses, they would inherit or implement this same initializer. There is doubt on this point, because of the rule that if a subclass has a designated initializer of its own, no initializers from the superclass are inherited. Thus it is possible for a superclass to have an initializer and the subclass not to have it.
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /**
     Sets up the Profile button to the left side of the parent view with a fourth of the width.
     */
    private func setUpProfileButton(){
        profileButton.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        profileButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        profileButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        
    }
    /**
     Sets up the Settings button to the right side of the parent view with a fourth of the width.
     */
    private func setUpSettingsButton(){
        settingsButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        settingsButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        settingsButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
    }
    
    
    
   
    

}
