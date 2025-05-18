//
//  GFButton.swift
//  GHFollowers
//
//  Created by Huang Yi An on 14/5/25.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder): has not been implement")
    }
    
    init(backgroudColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroudColor
        self.setTitle(title, for: .normal)
        configButton()
    }
    
    private func configButton() {
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
