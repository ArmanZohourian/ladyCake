//
//  BuyCourseCells.swift
//  ladycake
//
//  Created by Arman on 2/20/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit
 // Doing all the cells configuiration for the buy course view here
class BuyCourseCell : BaseCell {
    
    let seprator : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var capacity = 110.0
    
    let cakeNameLabel : UILabel = {
        let label = UILabel()
        label.text = "پخت کیک"
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return label
    }()
    
    let capacityLabel : UILabel = {
        let label = UILabel()
        label.text = " مگابایت "
        label.textAlignment = .right
        label.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    let price : UILabel = {
        let label = UILabel()
        label.text = "قیمت : ۰ تومان"
        label.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let fileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "file-logo")
        return imageView
    }()
    
    let cakeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cake-image")
        imageView.backgroundColor = UIColor.green
        return imageView
    }()
    
    let buyTheFile : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.3737025464, green: 0.8078431487, blue: 0.7940439023, alpha: 1)
        imageView.layer.cornerRadius = 10.0
        return imageView
    }()
    
  
    override func setUpViews() {
//        backgroundColor = UIColor.blue
        // cake image
        cakeImage.translatesAutoresizingMaskIntoConstraints = false
        buyTheFile.translatesAutoresizingMaskIntoConstraints = false 
        addSubview(cakeImage)
        addSubview(cakeNameLabel)
        addSubview(capacityLabel)
        addSubview(price)
        addSubview(seprator)
        addSubview(buyTheFile)
        cakeImage.backgroundColor = UIColor.blue
        
        addConstaintsWithFormat(format: "V:|-5-[v0]-5-|", views: cakeImage)
        addConstaintsWithFormat(format: "H:|-200-[v0]-4-|", views: cakeImage)
        
        // cake name label
        addConstraint(NSLayoutConstraint(item: cakeNameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: +10))
        addConstraint(NSLayoutConstraint(item: cakeNameLabel, attribute: .right, relatedBy: .equal, toItem: cakeImage, attribute: .left, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: cakeNameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint(item: cakeNameLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 80))
        
        addConstraint(NSLayoutConstraint(item: capacityLabel, attribute: .top, relatedBy: .equal, toItem: cakeNameLabel, attribute: .bottom, multiplier: 1, constant: +10))
        addConstraint(NSLayoutConstraint(item: capacityLabel, attribute: .right, relatedBy: .equal, toItem: cakeImage, attribute: .left, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: capacityLabel, attribute: .height, relatedBy: .equal, toItem: cakeNameLabel, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint(item: capacityLabel, attribute: .width, relatedBy: .equal, toItem: cakeNameLabel, attribute: .width, multiplier: 0, constant: 60))
        
        addConstraint(NSLayoutConstraint(item: price, attribute: .top, relatedBy: .equal, toItem: capacityLabel, attribute: .bottom, multiplier: 1, constant: +10))
        addConstraint(NSLayoutConstraint(item: price, attribute: .right, relatedBy: .equal, toItem: cakeImage, attribute: .left, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: price, attribute: .height, relatedBy: .equal, toItem: capacityLabel, attribute: .height, multiplier: 0, constant: 20 ))
        addConstraint(NSLayoutConstraint(item: price, attribute: .width, relatedBy: .equal, toItem: capacityLabel, attribute: .width, multiplier: 0, constant: 70))
        
        // seperator constraints
         addConstraint(NSLayoutConstraint(item: seprator, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
         addConstraint(NSLayoutConstraint(item: seprator, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
         addConstraint(NSLayoutConstraint(item: seprator, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
         addConstraint(NSLayoutConstraint(item: seprator, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 1))
    
        
        addConstraint(NSLayoutConstraint(item: buyTheFile, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: +3))
        addConstraint(NSLayoutConstraint(item: buyTheFile, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -8))
        addConstraint(NSLayoutConstraint(item: buyTheFile, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint(item: buyTheFile, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 60))
        
        
//        addConstaintsWithFormat(format: "H:|-130-[v0]-17-[v1]-5-|", views:  cakeNameLabel , cakeImage)
//        addConstaintsWithFormat(format: "H:|-130-[v0]-17-[v1]-5-|", views:  capacityLabel , cakeImage)
//        addConstaintsWithFormat(format: "V:|-16-[v0(11)]-10-[v1(11)]-15-[v2(30)]-[v3(1)]-100-|", views: cakeNameLabel , capacityLabel , price , seprator)
//        addConstaintsWithFormat(format: "H:|-8-[v0(70)]-40-[v1]-17-[v2(145)]-5-|", views: buyTheFile , price , cakeImage)
//        addConstaintsWithFormat(format: "V:|-5-[v0]-5-[v1(1)]|", views: cakeImage , seprator)
//        addConstaintsWithFormat(format: "H:|[v0]|", views: seprator)
//        addConstaintsWithFormat(format: "V:|-70-[v0(30)]-8-[v1]|", views: buyTheFile , seprator)
        
    }
    
}

