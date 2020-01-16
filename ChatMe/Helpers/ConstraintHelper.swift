//
//  ConstraintHelper.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/21/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import Foundation
import UIKit
struct ConstraintHelper {
    
    /**
     Sets the top anchor constraint to the safe areea constraint of the parent view
     */
    public func setUpNavBar(navBar: NavBar, parentView: UIView){
        navBar.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        navBar.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor).isActive = true
        navBar.heightAnchor.constraint(equalTo: parentView.heightAnchor, multiplier: 0.05).isActive = true
        navBar.widthAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true
        // Adding targets to navbar buttons are handled within the view controller where this method is being used
    }
    public func setTopAnchor(parentView: UIView, subView: UIView, x: NSLayoutXAxisAnchor, y: NSLayoutYAxisAnchor){
        subView.centerXAnchor.constraint(equalTo: x).isActive = true
        subView.topAnchor.constraint(equalTo: y).isActive = true
    }
    public func setWidthAndHeight(subview: UIView, width: NSLayoutDimension, widthMult: CGFloat, height: NSLayoutDimension, heightMult: CGFloat){
        subview.widthAnchor.constraint(equalTo: width, multiplier: widthMult).isActive = true
        subview.heightAnchor.constraint(equalTo: height, multiplier: heightMult).isActive = true
    }
    public func setLeftAnchor(subView: UIView, x: NSLayoutXAxisAnchor, y: NSLayoutYAxisAnchor){
        subView.leftAnchor.constraint(equalTo: x).isActive = true
        subView.centerYAnchor.constraint(equalTo: y).isActive = true
    }
}
