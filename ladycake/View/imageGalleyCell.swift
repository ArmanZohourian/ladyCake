//
//  imageGalleyCell.swift
//  ladycake
//
//  Created by Arman on 2/29/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class imageGalleryCell : BaseCell {
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "someimage")
        imageView.backgroundColor = UIColor.orange
        return imageView
    }()
    
    
    override func setUpViews() {
//        backgroundColor = UIColor.orange
        
        addSubview(imageView)
        
        addConstaintsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstaintsWithFormat(format: "V:|[v0]|", views: imageView)
        
    }
    
}
