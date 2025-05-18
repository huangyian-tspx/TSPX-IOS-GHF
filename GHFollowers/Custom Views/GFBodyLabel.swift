//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Huang Yi An on 14/5/25.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        config()
    }
    
    
    
    private func config() {
        textColor                   = .secondaryLabel
        adjustsFontSizeToFitWidth   = true
        font                        = UIFont.preferredFont(forTextStyle: .body)
        minimumScaleFactor          = 0.75
        lineBreakMode               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
