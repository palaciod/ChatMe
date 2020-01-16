//
//  Profile.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/21/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class Profile: UIView {
    private let whiteSpace: UIView = {
        let space = UIView()
        space.translatesAutoresizingMaskIntoConstraints = false
        space.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return space
    }()
    public let profilePicture: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "ProfileIcon")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    public let changePictureButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Profile Picture", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
        return button
    }()
    private let publicInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.axis = .vertical
        stack.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return stack
    }()
    
    public let firstSetting: InputTextField = {
        let textInput = InputTextField()
        textInput.leftLabel.text = "Name"
        textInput.rightTextField.placeholder = "Name"
        return textInput
    }()
    public let secondSetting: InputTextField = {
        let textInput = InputTextField()
        textInput.leftLabel.text = "Username"
        textInput.rightTextField.placeholder = "Username"
        return textInput
    }()
    public let thirdSetting: InputTextField = {
        let textInput = InputTextField()
        textInput.leftLabel.text = "Email"
        textInput.rightTextField.placeholder = "Email"
        return textInput
    }()
    public let fourthSetting: InputTextField = {
        let textInput = InputTextField()
        textInput.leftLabel.text = "Phone"
        textInput.rightTextField.placeholder = "Phone"
        return textInput
    }()
    public let fifthPhone: InputTextField = {
        let textInput = InputTextField()
        textInput.leftLabel.text = "Gender"
        textInput.rightTextField.placeholder = "Gender"
        return textInput
    }()
    
    public let PrivateInfo: UILabel = {
        let label = UILabel()
        label.text = "Private Information: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        return label
    }()
    public let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.setTitle("Update", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let helper: ConstraintHelper = {
        let helper = ConstraintHelper()
        return helper
    }()
    
    /**
     The initializer for this class. Inherits from UIView.
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(whiteSpace)
        self.addSubview(profilePicture)
        setUpWhiteSpace()
//        Setting up the profile Picture
        helper.setTopAnchor(parentView: self, subView: profilePicture, x: self.centerXAnchor, y: whiteSpace.bottomAnchor)
        
        helper.setWidthAndHeight(subview: profilePicture, width: self.widthAnchor, widthMult: 1/2, height: profilePicture.widthAnchor, heightMult: 1)
        //Setting up the change Text button
        self.addSubview(changePictureButton)
        helper.setTopAnchor(parentView: profilePicture, subView: changePictureButton, x: self.centerXAnchor, y: profilePicture.bottomAnchor)
        helper.setWidthAndHeight(subview: changePictureButton, width: profilePicture.widthAnchor, widthMult: 0.8, height: self.heightAnchor, heightMult: 1/15)
        
//        Adding the public info stack
        self.addSubview(publicInfoStack)
        
        setUpStack()
    }
    public func setUpWhiteSpace(){
        helper.setTopAnchor(parentView: self, subView: whiteSpace, x: self.centerXAnchor, y: self.topAnchor)
        helper.setWidthAndHeight(subview: whiteSpace, width: self.widthAnchor, widthMult: 1, height: self.heightAnchor, heightMult: 1/30)
    }
    
    public func setUpStack(){
        
        publicInfoStack.addArrangedSubview(firstSetting)
        publicInfoStack.addArrangedSubview(secondSetting)
        publicInfoStack.addArrangedSubview(PrivateInfo)
        publicInfoStack.addArrangedSubview(thirdSetting)
        publicInfoStack.addArrangedSubview(fourthSetting)
        publicInfoStack.addArrangedSubview(fifthPhone)
        publicInfoStack.addArrangedSubview(updateButton)
        
        helper.setTopAnchor(parentView: self, subView: publicInfoStack, x: self.centerXAnchor, y: changePictureButton.bottomAnchor)
        helper.setWidthAndHeight(subview: publicInfoStack, width: self.widthAnchor, widthMult: 0.9, height: self.heightAnchor, heightMult: 0.4)
        
    }
    
    
    
    
    
    
    /**
     Satisfying the compiler to assure it that if this class were to have any subclasses, they would inherit or implement this same initializer. There is doubt on this point, because of the rule that if a subclass has a designated initializer of its own, no initializers from the superclass are inherited. Thus it is possible for a superclass to have an initializer and the subclass not to have it.
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    

}
