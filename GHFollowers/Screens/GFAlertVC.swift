//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Huang Yi An on 14/5/25.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let container       = UIView()
    let actionButton    = GFButton(backgroudColor: .systemPink, title: "Ok")
    let titleLabel      = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let bodyLabel    = GFBodyLabel(textAlignment: .center, fontSize: 20)
    
    var alertTitle: String?
    var bodyMessage: String?
    var titleButton: String?
    
    let padding: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configContainerView()
        configTitleLabel()
        configButtonAction()
        configBodyLabel()
        // Do any additional setup after loading the view.
    }
    
    init(title: String, message: String, titleButton: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle     = title
        self.bodyMessage    = message
        self.titleButton    = titleButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContainerView() {
        view.addSubview(container)
        container.backgroundColor           = .systemBackground
        container.layer.cornerRadius        = 16
        container.layer.borderWidth         = 2
        container.layer.borderColor         = UIColor.white.cgColor
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.heightAnchor.constraint(equalToConstant: 220),
            container.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
    
    private func configTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Someting went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configButtonAction() {
        container.addSubview(actionButton)
        actionButton.setTitle(titleButton ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configBodyLabel(){
        container.addSubview(bodyLabel)
        bodyLabel.text              = bodyMessage ?? "Unable to comple request"
        bodyLabel.numberOfLines     = 4
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -padding),
            bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dissmissVC() {
        dismiss(animated: true)
    }
   


}
