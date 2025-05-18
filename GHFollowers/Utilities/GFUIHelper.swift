//
//  GFUIHelper.swift
//  GHFollowers
//
//  Created by Huang Yi An on 16/5/25.
//

import  UIKit

struct GFUIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                           = view.bounds.width
        let padding: CGFloat                = 12
        let minimumSpacingItem: CGFloat     = 10
        let availableWidth                  = width - (padding * 2) - (minimumSpacingItem * 2)
        let itemWidth                       = availableWidth / 3
        
        let flowLayout          = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize     = CGSize(width: itemWidth, height: itemWidth + 30)
        
        return flowLayout
            
    }
    
}
