//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Huang Yi An on 14/5/25.
//

import UIKit

class SearchVC: UIViewController {
    let imageLogoView       = UIImageView()
    let usernameTextField   = GFTextField()
    let callToActionButton  = GFButton(backgroudColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered : Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configImageLogoView()
        configUsernameTextfield()
        configCallToActionButton()
        createDismissKeyboardByTapOther()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true) // -> tránh back lại hiện navigation bar
    }
    
    private func configImageLogoView() {
        view.addSubview(imageLogoView)
        imageLogoView.translatesAutoresizingMaskIntoConstraints = false
        imageLogoView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            imageLogoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            imageLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLogoView.heightAnchor.constraint(equalToConstant: 200),
            imageLogoView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func configUsernameTextfield(){
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: imageLogoView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configCallToActionButton(){
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func createDismissKeyboardByTapOther(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", body: "Please enter a username. We need to know who to look for", titleButton: "Ok")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
}
extension SearchVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        print("Taps go")
        return true
    }
}
