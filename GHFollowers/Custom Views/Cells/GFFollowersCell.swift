//
//  GFFollowersCell.swift
//  GHFollowers
//
//  Created by Huang Yi An on 16/5/25.
//

import UIKit

class GFFollowersCell: UICollectionViewCell {
    
    static let reusedID = "GFFollowersCell"
    
    let avatarImageView = GFImageView(frame: .zero)
    let usernameLabelView = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(follower: FollowerModel){
        usernameLabelView.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl ?? "")
    }
    
    private func configCell() {
        contentView.addSubview(avatarImageView)
        contentView.addSubview(usernameLabelView)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding : CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabelView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabelView.heightAnchor.constraint(equalToConstant: 20),
        ])
        
    }
    
}
