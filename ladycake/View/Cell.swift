//
//  Cell.swift
//  ladycake
//
//  Created by Arman on 2/18/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class BaseCell : UICollectionViewCell {
    override init(frame : CGRect) {
        super.init(frame : frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
    
    }
}

