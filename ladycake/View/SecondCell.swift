//
//  SecondCell.swift
//  ladycake
//
//  Created by Arman on 3/1/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit

class SecondCell : UICollectionViewCell , UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource  {
    
    
    
    
    let cellId = "cellId"
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
        
    }()

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
    
    
    
}
