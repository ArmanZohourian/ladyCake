//
//  SlideShowCell.swift
//  ladycake
//
//  Created by Arman on 3/1/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class SlideShowCell : BaseCell {
    
//    var cakeImageViews =
    
    let cakeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func setUpViews() {
        addSubview(cakeImage)
        
        addConstaintsWithFormat(format: "V:|[v0]|", views: cakeImage)
        addConstaintsWithFormat(format: "H:|[v0]|", views: cakeImage)
//        backgroundColor = UIColor.systemBlue
    }
}
