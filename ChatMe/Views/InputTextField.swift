//
//  InputTextField.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/22/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit

class InputTextField: UIView {
    public let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue", size: 14.0)
        return label
    }()
    public let rightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Custom"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont(name: "HelveticaNeue", size: 14.0)
        return textField
    }()
    private let helper: ConstraintHelper = {
        let helper = ConstraintHelper()
        return helper
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(leftLabel)
        self.addSubview(rightTextField)
//        setUpConstraints()
//         Setting up the left side
        helper.setLeftAnchor( subView: leftLabel, x: self.leftAnchor, y: self.centerYAnchor)
        helper.setWidthAndHeight(subview: leftLabel, width: self.widthAnchor, widthMult: 1/4, height: self.heightAnchor, heightMult: 1)
//        Setting up the right side
        helper.setLeftAnchor(subView: rightTextField, x: leftLabel.rightAnchor, y: self.centerYAnchor)
        helper.setWidthAndHeight(subview: rightTextField, width: self.widthAnchor, widthMult: 3/4, height: self.heightAnchor, heightMult: 1)
    }
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
