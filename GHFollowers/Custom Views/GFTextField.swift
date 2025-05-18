//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Huang Yi An on 14/5/25.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //add config here below
        configTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implement storyboard here")
    }
    
    private func configTextField () {
        translatesAutoresizingMaskIntoConstraints = false
        //config base layer
        layer.cornerRadius  = 10
        layer.borderWidth   = 2
        layer.borderColor   = UIColor.systemGray4.cgColor
        
        //continue config text
        textColor       = .label
        textAlignment   = .center
        tintColor       = .label
        font            = UIFont.preferredFont(forTextStyle: .title2)
        minimumFontSize = 12
        adjustsFontSizeToFitWidth = true
        
        //config other
        backgroundColor     = .tertiarySystemBackground
        autocorrectionType  = .no // -> becouse user name of user ís very linh tinh
        returnKeyType       = .go
        placeholder         = "Enter a username"
    }

}
