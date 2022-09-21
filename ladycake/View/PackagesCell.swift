//
//  packagesCell.swift
//  ladycake
//
//  Created by Arman on 2/22/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class PackagesCell : BaseCell {
    
    let seperator : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        return view
    }()
    let secondSeperator : UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.darkGray
           return view
       }()
    
    let favoriteButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return button
    }()
    
    let packImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgournd-image")
        imageView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        return imageView
    }()
    
    let titleLable : UILabel = {
        let label = UILabel()
//        label.text = "Something ..."
        label.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        label.textAlignment = .center
        label.sizeToFit()
        label.numberOfLines = 0
        return label
    }()
    
    let priceLabel : UILabel = {
          let label = UILabel()
//          label.text = "1111"
          label.textAlignment = .center
          label.sizeToFit()
          label.numberOfLines = 0
          label.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
          return label
      }()
      
    
    let packageLabel : UILabel = {
        let label = UILabel()
//        label.text = "پکیج صفر تا صد "
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    let fileLabel : UILabel = {
        let label = UILabel()
//        label.text = "۱۷ فایل "
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return label
    }()
    
    let priceShape : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "priceshape")
        imageView.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        return imageView
    }()
    
    let packShape : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "packshape")
//        imageView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        return imageView
        
    }()
    let fileShape : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "file")
        return imageView
        
    }()
    
    let walletShape : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wallet")
        return imageView
    }()
    
    override func setUpViews() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        packImage.translatesAutoresizingMaskIntoConstraints = false
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        packageLabel.translatesAutoresizingMaskIntoConstraints = false
        fileLabel.translatesAutoresizingMaskIntoConstraints = false
        priceShape.translatesAutoresizingMaskIntoConstraints = false
        packShape.translatesAutoresizingMaskIntoConstraints = false
        fileShape.translatesAutoresizingMaskIntoConstraints = false
        seperator.translatesAutoresizingMaskIntoConstraints = false
        secondSeperator.translatesAutoresizingMaskIntoConstraints = false
        walletShape.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        backgroundColor = UIColor.white
        addSubview(packImage)
        addSubview(favoriteButton)
        addSubview(titleLable)
        addSubview(priceLabel)
        addSubview(fileShape)
        addSubview(fileLabel)
        addSubview(seperator)
        addSubview(priceShape)
        addSubview(packageLabel)
        addSubview(packShape)
        addSubview(secondSeperator)
        addSubview(walletShape)
        
        
        addConstaintsWithFormat(format: "V:|[v0]-70-|", views: packImage)
        addConstaintsWithFormat(format: "H:|[v0]|", views: packImage)
        
        
        // Favorite button constraints
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 20))
        
        //title label constraints
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .top, relatedBy: .equal, toItem: packImage, attribute: .bottom, multiplier: 1, constant: 3))
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: titleLable, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
        
        // file shape
        addConstraint(NSLayoutConstraint(item: fileShape, attribute: .top, relatedBy: .equal, toItem: packImage, attribute: .bottom, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: fileShape, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: fileShape, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 25))
        addConstraint(NSLayoutConstraint(item: fileShape, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        
        // file label
        addConstraint(NSLayoutConstraint(item: fileLabel, attribute: .top, relatedBy: .equal, toItem: fileShape, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: fileLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 18))
         addConstraint(NSLayoutConstraint(item: fileLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 15))
        addConstraint(NSLayoutConstraint(item: fileLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 25))
        
        // first line seperator
        addConstraint(NSLayoutConstraint(item: seperator, attribute: .top, relatedBy: .equal, toItem: titleLable, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: seperator, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -5))
        addConstraint(NSLayoutConstraint(item: seperator, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 1))
        addConstraint(NSLayoutConstraint(item: seperator, attribute: .left, relatedBy: .equal, toItem: fileShape, attribute: .right, multiplier: 1, constant: 10))
        
        // Package shape
        addConstraint(NSLayoutConstraint(item: packShape, attribute: .left, relatedBy: .equal, toItem: seperator, attribute: .right, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: packShape, attribute: .top, relatedBy: .equal, toItem: packImage, attribute: .bottom, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: packShape, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 25))
        addConstraint(NSLayoutConstraint(item: packShape, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        
        // Pack name
        addConstraint(NSLayoutConstraint(item: packageLabel, attribute: .top, relatedBy: .equal, toItem: packShape, attribute: .bottom, multiplier: 1, constant: 2))
        addConstraint(NSLayoutConstraint(item: packageLabel, attribute: .left, relatedBy: .equal, toItem: seperator, attribute: .right, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: packageLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 40))
        addConstraint(NSLayoutConstraint(item: packageLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 18))
        
        //Second seperator
        addConstraint(NSLayoutConstraint(item: secondSeperator, attribute: .left, relatedBy: .equal, toItem: packShape, attribute: .right, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: secondSeperator, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -5))
        addConstraint(NSLayoutConstraint(item: secondSeperator, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 1))
        addConstraint(NSLayoutConstraint(item: secondSeperator, attribute: .top, relatedBy: .equal, toItem: titleLable, attribute: .bottom, multiplier: 1, constant: 5))
        
        // Wallet shape
        addConstraint(NSLayoutConstraint(item: walletShape, attribute: .left, relatedBy: .equal, toItem: secondSeperator, attribute: .right, multiplier: 1, constant: 10))
         addConstraint(NSLayoutConstraint(item: walletShape, attribute: .top, relatedBy: .equal, toItem: packImage, attribute: .bottom, multiplier: 1, constant: 20))
         addConstraint(NSLayoutConstraint(item: walletShape, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 25))
         addConstraint(NSLayoutConstraint(item: walletShape, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        
        // price label
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .left, relatedBy: .equal, toItem: secondSeperator, attribute: .right, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .top, relatedBy: .equal, toItem: walletShape, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -7))
        addConstraint(NSLayoutConstraint(item: priceLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
        
        
        
        
        
        
        
        
        
        
        
        
//        //Favorite button
//        addConstaintsWithFormat(format: "V:|-8-[v0(30)]-95-[v1(10)]-2-[v2]-15-|", views: favoriteButton , fileShape , fileLabel)
//        addConstaintsWithFormat(format: "H:|-8-[v0(40)]-130-|", views: favoriteButton)
//
//        //Pack Image
//        addConstaintsWithFormat(format: "V:|[v0]-3-[v1(15)]-2-[v2(46)]-2-|", views: packImage , titleLable , seperator)
////        addConstaintsWithFormat(format: "V:||", views: packImage , secondSeperator)
//        addConstaintsWithFormat(format: "H:|[v0]|", views: packImage)
//
//        //ttile Lable
//        addConstaintsWithFormat(format: "H:|-30-[v0]-30-|", views: titleLable)
//        addConstaintsWithFormat(format: "H:|-11-[v0(5)]-11-[v1(1)]-120-|", views: fileShape , seperator)
//
//        addConstaintsWithFormat(format: "H:|-9-[v0(30)]-9-[v1]-120-|", views: fileLabel , seperator)
        
        
    }
}


