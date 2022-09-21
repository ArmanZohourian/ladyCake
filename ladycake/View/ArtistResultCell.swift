//
//  ArtistResultCell.swift
//  ladycake
//
//  Created by Arman on 2/25/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class ArtistResultCell : BaseCell  {
    
    
    let scrollImageView : UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = UIColor.orange
        scrollview.translatesAutoresizingMaskIntoConstraints = true
        return scrollview
    }()
    
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "user-photo")
        imageView.backgroundColor = UIColor.green
        return imageView
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.text = "۱۳۰۰/۱۲/۱۲"
        label.backgroundColor = UIColor.orange
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textAlignment = .right
        return label
    }()
    
    let userName : UILabel = {
        let label = UILabel()
        label.text = "username"
        label.textAlignment = .right
        label.backgroundColor = UIColor.blue
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let favoriteButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    let favoriteCountLable : UILabel = {
        let label = UILabel()
        label.text = "۰"
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    let cakeLable : UILabel = {
        let label = UILabel()
        label.text = "شیرنی فروشی "
        label.textAlignment = .center
        label.backgroundColor = UIColor.gray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let cakeName : UILabel = {
       let label = UILabel()
        label.text = "شیرنی فروشی "
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seperator : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let imageSeperator : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateSeperator : UILabel = {
        let label = UILabel()
        label.text = " - "
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let images = [UIImage]()
    
    override func setUpViews() {
        
        //set up elements in the cell
        backgroundColor = UIColor.yellow
        
        addSubview(profileImageView)
        addSubview(dateLabel)
        addSubview(userName)
        addSubview(favoriteButton)
        addSubview(favoriteCountLable)
        addSubview(cakeLable)
        addSubview(seperator)
        addSubview(cakeName)
        addSubview(imageSeperator)
        addSubview(scrollImageView)
        addSubview(dateSeperator)
        addSubview(dateLabel)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteCountLable.translatesAutoresizingMaskIntoConstraints = false
        cakeLable.translatesAutoresizingMaskIntoConstraints = false
        seperator.translatesAutoresizingMaskIntoConstraints = false
        
        addConstaintsWithFormat(format: "V:|-5-[v0]-110-|", views: profileImageView)
        addConstaintsWithFormat(format: "H:|-293-[v0]-10-|", views: profileImageView)
        
        // username
        addConstraint(NSLayoutConstraint(item: userName, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 15))
        addConstraint(NSLayoutConstraint(item: userName, attribute: .right, relatedBy: .equal, toItem: profileImageView, attribute: .left, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: userName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint(item: userName, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 60))
        
        //cake category
        addConstraint(NSLayoutConstraint(item: cakeLable, attribute: .top, relatedBy: .equal, toItem: userName, attribute: .bottom, multiplier: 1, constant: +5))
        addConstraint(NSLayoutConstraint(item: cakeLable, attribute: .right, relatedBy: .equal, toItem: profileImageView, attribute: .left, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: cakeLable, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 10))
        addConstraint(NSLayoutConstraint(item: cakeLable, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 50))
        
        //cake name
        addConstraint(NSLayoutConstraint(item: cakeName, attribute: .top, relatedBy: .equal, toItem: profileImageView, attribute: .bottom, multiplier: 1, constant: +5))
        addConstraint(NSLayoutConstraint(item: cakeName, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: cakeName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 25))
        addConstraint(NSLayoutConstraint(item: cakeName, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 70))
        
        //image Seperator
        addConstraint(NSLayoutConstraint(item: imageSeperator, attribute: .top, relatedBy: .equal, toItem: cakeName, attribute: .bottom, multiplier: 1, constant: +5))
        addConstraint(NSLayoutConstraint(item: imageSeperator, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageSeperator, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageSeperator, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 2))
        
        // Favorite Button
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: +5))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: +15))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        addConstraint(NSLayoutConstraint(item: favoriteButton, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 30))
        
        // Favorite countLabel
        addConstraint(NSLayoutConstraint(item: favoriteCountLable, attribute: .top, relatedBy: .equal, toItem: favoriteButton, attribute: .bottom, multiplier: 1, constant: +3))
        addConstraint(NSLayoutConstraint(item: favoriteCountLable, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: +24))
        addConstraint(NSLayoutConstraint(item: favoriteCountLable, attribute: .height, relatedBy: .equal, toItem: favoriteButton, attribute: .height, multiplier: 0, constant: 10))
        addConstraint(NSLayoutConstraint(item: favoriteCountLable, attribute: .width, relatedBy: .equal, toItem: favoriteButton, attribute: .width, multiplier: 0, constant: 10))
        
        // Scorll image view
        addConstraint(NSLayoutConstraint(item: scrollImageView, attribute: .top, relatedBy: .equal, toItem: imageSeperator, attribute: .bottom, multiplier: 1, constant: +1))
        addConstraint(NSLayoutConstraint(item: scrollImageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: scrollImageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: scrollImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        
        // date seperator
        addConstraint(NSLayoutConstraint(item: dateSeperator, attribute: .right, relatedBy: .equal, toItem: userName, attribute: .left, multiplier: 1, constant: 2))
        addConstraint(NSLayoutConstraint(item: dateSeperator, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 15))
        addConstraint(NSLayoutConstraint(item: dateSeperator, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        addConstraint(NSLayoutConstraint(item: dateSeperator, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0, constant: 10))
        
        //date
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 15))
         addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .right, relatedBy: .equal, toItem: dateSeperator, attribute: .left, multiplier: 1, constant: 0))
         addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .height , relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
         addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width , multiplier: 0, constant: 40))
        
        
        
        
        
        
//        addConstaintsWithFormat(format: "H:|-293-[v0(5)]-2-[v1(20)]-8-|", views: userName , profileImageView)
//        addConstaintsWithFormat(format: "V:|-5-[v0(20)]-100-|", views: profileImageView)
//        addConstaintsWithFormat(format: "V:|-5-[v0]-150-|", views: userName)

    }
}
