//
//  menuCell.swift
//  ladycake
//
//  Created by Arman on 2/18/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class menuCell: BaseCell {
    
    var menu : Menu? {
        didSet {
            textLabel.text = menu?.name
            iconImageView.image = UIImage(named: menu!.imageName)
            
        }
    }
    
    // seperator
    let seperator : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.6557146256, green: 0.5346589944, blue: 0.3948760555, alpha: 1)
        return view
    }()
    // Cake logo on the top of the collection view
    let logoImageVew : UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.image = UIImage(named: "Cake-Logo")
        return logoImageView
        
    }()
    
    
    var textLabel : UILabel = {
        let label = UILabel()
        label.text = "Working... "
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .right
        return label 
    }()
    // icon images beside the labels
    let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "side-icon")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setUpViews() {
        super.setUpViews()
//        backgroundColor = UIColor.black
        addSubview(textLabel)
        addSubview(iconImageView)
        addSubview(seperator)
        addConstaintsWithFormat(format: "H:|-150-[v0]-2-[v1(25)]-8-|", views: textLabel , iconImageView)
        addConstaintsWithFormat(format: "H:|[v0]|", views: seperator)
        addConstaintsWithFormat(format: "V:|[v0]-8-[v1(2)]|", views: textLabel , seperator)
        // declaring the height of the icon image
        addConstaintsWithFormat(format: "V:[v0(25)]-8-[v1(2)]|", views: iconImageView , seperator)
//        backgroundColor = UIColor.black
    }
    func underBrownLineTextLabel(_ label : UILabel) -> UILabel {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: label.frame.size.width, y: label.frame.size.height
            , width: label.frame.size.width, height: label.frame.size.height)
        bottomLine.backgroundColor = #colorLiteral(red: 1, green: 0.6848958415, blue: 0.3777774326, alpha: 1)
        label.layer.addSublayer(bottomLine)
        return label
    }
}

extension UIView {
    func addConstaintsWithFormat(format : String , views : UIView...) {
        var viewDictionary = [String: UIView]()
        for (index , view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: format,metrics: nil, views: viewDictionary))
    }
}
