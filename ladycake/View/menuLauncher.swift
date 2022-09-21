//
//  menuLauncher.swift
//  ladycake
//
//  Created by Arman on 2/18/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class Menu : NSObject {
    let name : String
    let imageName : String
    
    init(name : String , imageName : String) {
        self.name = name
        self.imageName = imageName
    }
}


class menuLauncher : NSObject , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    let creditLeftLabel : UILabel = {
        let label = UILabel()
        label.text = "اعتبار کیف پول شما "
        return label
    }()
    
    var currencyLeft = 0 {
        didSet {
            currencyLeftLabel.text = "تومان : \(currencyLeft)"
        }
    }
    
    var currencyLeftLabel : UILabel {
        let defaultLabel = UILabel()
        defaultLabel.text = "تومان ۰"
        return defaultLabel
    }
    
    //Declaring the collection view
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        let imageView = UIImageView(image: UIImage(named: "9"))
        cv.backgroundView = imageView
        let logoImageView = UIImageView(image: UIImage(named: "8"))
        cv.addSubview(logoImageView)
        //Creating and Constraining Labels
        let creditLeftLabel : UILabel = {
              let label = UILabel()
              label.text = "اعتبار کیف پول شما "
              return label
          }()
        var currencyLeftLabel : UILabel {
               let defaultLabel = UILabel()
               defaultLabel.text = "تومان ۰"
               return defaultLabel
           }
        cv.addSubview(creditLeftLabel)
        creditLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        creditLeftLabel.bottomAnchor.constraint(equalTo: cv.bottomAnchor).isActive = true
        creditLeftLabel.trailingAnchor.constraint(equalTo: cv.trailingAnchor).isActive = true
        
        // Constraining logoImage View
        
       logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.leadingAnchor.constraint(equalTo : cv.leadingAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: cv.topAnchor , constant: -10).isActive = true
//        logoImageView.topAnchor.constraint(equalTo: cv.topAnchor , constant: -50).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        return cv 
    }()
    
    let cellId = "cellId"
    let menu : [Menu] = {
        return [Menu(name: "پروفایل کاربری", imageName: "2") ,
                Menu(name: "لیست سفارشات", imageName: "side-icon"),
                Menu(name: "علاقه مندی ها ", imageName: "3"),
                Menu(name: "جزوه های آموزشی", imageName: "side-icon"),
                Menu(name: "درباره ما", imageName: "4"),
                Menu(name: "تماس با ما", imageName: "5"),
                Menu(name: "تنظیمات", imageName: "side-icon"),
                Menu(name: "افزایش موجودی کیف", imageName: "7"),
                Menu(name: "خروج از حساب", imageName: "6")]
    }()
    
    let blackTransparentView = UIView()
      func sideMenuTapped() {
           
        if let window = UIApplication.shared.keyWindow {
            blackTransparentView.backgroundColor = UIColor(white: 0, alpha: 0.5)
                
            self.collectionView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
            self.blackTransparentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackTransparentView)
            window.addSubview(collectionView)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
            collectionView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -50).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
            let width : CGFloat = 500
            let x = window.frame.width - width
            collectionView.frame = CGRect(x: 0, y: 0, width: window.frame.size.width
                , height: window.frame.height)
            blackTransparentView.frame = window.frame
            blackTransparentView.alpha = 0
           
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.blackTransparentView.alpha = 1
                                self.collectionView.frame = CGRect(x: 100, y: 0, width: self.collectionView.frame.width
                                    , height: self.collectionView.frame.height)
            }, completion: nil)
//            UIView.animate(withDuration: 0.5) {
//                self.blackTransparentView.alpha = 1
//                self.collectionView.frame = CGRect(x: 100, y: 0, width: self.collectionView.frame.width
//                    , height: self.collectionView.frame.height)
//            }
        }
       
       }
       
       @objc private func handleDismiss() {
           UIView.animate(withDuration: 0.5) {
            self.blackTransparentView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: -window.frame.width, y: 0, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }
          
           
       }
    // Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    // contents of the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! menuCell
        let theMenu = menu[indexPath.item]
        cell.menu = theMenu
        
        return cell
    }
    // size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 170, left: 0, bottom: 0, right: 0)
    }
    
    
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(menuCell.self, forCellWithReuseIdentifier: cellId)
    }
}
