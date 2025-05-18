//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Huang Yi An on 15/5/25.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, body: String, titleButton: String) {
        DispatchQueue.main.async {
            let alert                       = GFAlertVC(title: title, message: body, titleButton: titleButton)
            alert.modalPresentationStyle    = .overFullScreen
            alert.modalTransitionStyle      = .crossDissolve
            self.present(alert, animated: true)
        }
    }
}

