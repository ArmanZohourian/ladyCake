//
//  File.swift
//  ladycake
//
//  Created by Arman on 2/22/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class CoursesCell : BaseCell {
     
    let courseImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "something")
        imageView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blue
        label.text = "Something ..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.sizeToFit()
        label.text = "5000"
        label.numberOfLines = 0
        return label
        
    }()
    
    
    override func setUpViews() {
        backgroundColor = UIColor.red
        addSubview(courseImage)
        addSubview(titleLabel)
        addSubview(priceLabel)
        
        addConstaintsWithFormat(format: "V:|-8-[v0(20)]-8-|", views: courseImage)
        addConstaintsWithFormat(format: "H:|-80-[v0(20)]-8-|", views: courseImage)
        
            //Right Constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: courseImage, attribute: .left, multiplier: 1, constant: -3))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 12))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: +10))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 40))
        //title Label Constraints
        
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .right, relatedBy: .equal, toItem: courseImage, attribute: .left, multiplier: 1, constant: -3))
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 12))
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 10))
        
            //top aspect
//        addConstaintsWithFormat(format: "V:|-20-[v0(10)]-20-|", views: titleLabel)
//        addConstaintsWithFormat(format: "H:|[v0(10)]|", views: titleLabel)
        
//        addConstaintsWithFormat(format: "H:|-50-[v0(30)]-8-[v1(50)]-8-|", views: titleLabel , courseImage)
//        addConstaintsWithFormat(format: "V:|-8-[v0]-8-|", views: courseImage)
//
//        addConstaintsWithFormat(format: "H:|-30-[v0(30)]-8-[v1]-8-|", views: priceLabel , courseImage)
//        addConstaintsWithFormat(format: "V:|-8-[v0(10)]-20-[v1(10)]-22-|", views: titleLabel , priceLabel)
    }
    
    
    @objc func addTofavorites() {
        
        // Add to favorites
        
    }
    
}
