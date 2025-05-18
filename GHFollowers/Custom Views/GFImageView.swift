//
//  GFImageView.swift
//  GHFollowers
//
//  Created by Huang Yi An on 16/5/25.
//

import UIKit

class GFImageView: UIImageView {
    
    let placeHolderImage = UIImage(named: "avatar-placeholder")
    let cache            = NetworkManager.shared.cache

    override init(frame: CGRect) {
        super.init(frame: frame)
        configImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configImage() {
        layer.cornerRadius  = 12
        clipsToBounds       = true
        image               = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false   
    }
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            print("📦 Loaded image from cache: \(urlString)")
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            cache.setObject(image, forKey: cacheKey)
            print("🌐 Downloaded and cached image: \(urlString)")
            DispatchQueue.main.async { self.image = image }
            
        }
        
        task.resume()
        
    }
    
}
