//
//  ProfileViewController.swift
//  ChatMe
//
//  Created by Daniel Palacio on 12/18/19.
//  Copyright © 2019 Daniel Palacio. All rights reserved.
//

import UIKit
import Kingfisher
class ProfileViewController: UIViewController {
    public var email: String?
    public var user: User?
    private var pictureUpdateStatus: Bool = false
    private let navBar: NavBar = {
        let bar = NavBar(frame: .zero)
        bar.profileButton.setTitle("", for: .normal)
        bar.settingsButton.setImage(#imageLiteral(resourceName: "messageIcon"), for: .normal)
        bar.settingsButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    public let profilePage: Profile = {
        let profile = Profile()
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    private let helper: ConstraintHelper = {
        let helper = ConstraintHelper()
        return helper
    }()
    private let firebaseModel: FirebaseModel = {
        let model = FirebaseModel()
        return model
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navBar)
        view.addSubview(profilePage)
        setName()
        setUsername()
        setEmail()
        setPhone()
        setGender()
        setProfilePicture()
        helper.setUpNavBar(navBar: navBar, parentView: view)
        navBar.settingsButton.addTarget(self, action: #selector(toMessageBoard), for: .touchUpInside)
        helper.setTopAnchor(parentView: navBar, subView: profilePage, x: view.centerXAnchor, y: navBar.bottomAnchor)
        helper.setWidthAndHeight(subview: profilePage, width: view.widthAnchor, widthMult: 1, height: view.heightAnchor, heightMult: 0.9)
        
        profilePage.updateButton.addTarget(self, action: #selector(updateInfo), for: .touchUpInside)
        profilePage.changePictureButton.addTarget(self, action: #selector(changePicture), for: .touchUpInside)
    }
    /**
     Sets the right side of the textfield container with users name.
     */
    private func setName(){
        profilePage.firstSetting.rightTextField.text = user?.getName()
    }
    /**
     Sets the right side of the textfield container with users username.
     */
    private func setUsername(){
        profilePage.secondSetting.rightTextField.text = user?.getUsername()
    }
    /**
     A method that will set the Input Text Field placeholder to the email located in firebase Auth
     */
    private func setEmail(){
        profilePage.thirdSetting.rightTextField.text = user?.getEmail()
    }
    
    private func setPhone(){
        profilePage.fourthSetting.rightTextField.text = user?.getPhone()
    }
    private func setGender(){
        profilePage.fifthPhone.rightTextField.text = user?.getGender()
    }
    
    private func setProfilePicture(){
        profilePage.profilePicture.kf.setImage(with: user?.getUrl())
        profilePage.profilePicture.contentMode = .scaleAspectFill
        profilePage.profilePicture.layer.borderWidth = 5
        profilePage.profilePicture.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
    
    
    /**
     A target method that will push the message board view controller to the navigator stack.
     */
    @objc private func toMessageBoard(){
        navigationController?.popViewController(animated: false)
    }
    /**
     A target method that will push the message board view controller to the navigator stack after updating user. Uploading the image to firebase storage takes time, without the dispatchque we will end up navigating out of the profile view controller without even uploading the image which will result with an AFNetworking request error code 999.
     */
    @objc private func updateInfo(){
        let name = profilePage.firstSetting.rightTextField.text
        
        let username = profilePage.secondSetting.rightTextField.text
        
        let phone = profilePage.fourthSetting.rightTextField.text
        
        let gender = profilePage.fifthPhone.rightTextField.text
        
        firebaseModel.updateUser(name: name!, username: username!, phone: phone!, gender: gender!)
        
        firebaseModel.uploadImage(image: profilePage.profilePicture)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigationController?.setViewControllers([MessageBoard()], animated: true)
        }
    }
    
    @objc private func changePicture(){
        print("Pressed Change picture button")
        showImagePickerController()
    }
    
    override func viewDidLayoutSubviews() {
        profilePage.profilePicture.layer.masksToBounds = false
        profilePage.profilePicture.layer.cornerRadius = profilePage.profilePicture.frame.height/2
        profilePage.profilePicture.clipsToBounds = true
    }

}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerController(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            profilePage.profilePicture.image = editedImage
            //fireBase.upLoadImageToStorage(image: editedImage, indexOfImage: indexButton)
            profilePage.profilePicture.contentMode = .scaleAspectFill
            profilePage.profilePicture.layer.borderWidth = 5
            profilePage.profilePicture.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            pictureUpdateStatus = true
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profilePage.profilePicture.image = originalImage
            //fireBase.upLoadImageToStorage(image: editedImage, indexOfImage: indexButton)
            profilePage.profilePicture.layer.masksToBounds = true
            profilePage.profilePicture.contentMode = .scaleAspectFit
            profilePage.profilePicture.layer.borderWidth = 5
            profilePage.profilePicture.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            pictureUpdateStatus = true
        }else{
            print("failedß")
        }
        dismiss(animated: true, completion: nil)
        picker.delegate = nil
    }
}
