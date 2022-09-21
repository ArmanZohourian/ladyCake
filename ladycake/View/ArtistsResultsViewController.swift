//
//  ArtistsResultsViewController.swift
//  ladycake
//
//  Created by Arman on 2/25/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class ArtistsResultsViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let cellId1 = "cellId2"
    
    let secondCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout )
        cv.translatesAutoresizingMaskIntoConstraints = true
        cv.backgroundColor = UIColor.black
        return cv
    }()
    
    
    let viewTitle : UILabel = {
        let label = UILabel()
        label.text = "نتایج هنرجویان "
//        label.backgroundColor = UIColor.black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let sortButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15.0
        button.backgroundColor = UIColor.brown
        button.setTitle("مرتب سازی بر اساس", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let navView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTouched), for: .touchUpInside)
        return button
    }() 
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.brown
        return cv
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
//        secondCollectionView.delegate = self
//        secondCollectionView.dataSource = self
//        secondCollectionView.register(imageGalleryCell.self, forCellWithReuseIdentifier: cellId1)
        collectionView.register(ArtistResultCell.self, forCellWithReuseIdentifier: cellId)
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        view.backgroundColor = UIColor.white
        view.addSubview(navView)
        view.addSubview(sortButton)
        view.addSubview(collectionView)
//        collectionView.addSubview(secondCollectionView)
        navView.addSubview(backButton)
        navView.addSubview(viewTitle)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //Nav bar view
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: +0).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //sort button
        sortButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +20).isActive = true
        sortButton.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: +10).isActive = true
        sortButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // back button
        backButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: +10).isActive = true
        backButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: +30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -10).isActive = true
        
        // view title
        viewTitle.topAnchor.constraint(equalTo: navView.topAnchor, constant: +20).isActive = true
        viewTitle.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -10).isActive = true
        viewTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewTitle.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        //Constraints
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +10).isActive = true
        collectionView.topAnchor.constraint(equalTo: sortButton.bottomAnchor, constant: +10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        // Second collection view constraints
//        secondCollectionView.leadingAnchor.constraint(equalTo: self.collectionView.leadingAnchor, constant: 0).isActive = true
//         secondCollectionView.topAnchor.constraint(equalTo: self.collectionView.topAnchor, constant: +20).isActive = true
//         secondCollectionView.trailingAnchor.constraint(equalTo: self.collectionView.trailingAnchor, constant: 0).isActive = true
//         secondCollectionView.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView {
            return 4
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            return CGSize(width: view.frame.width, height: 170)
        }
         return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let imageGalleyVC = ImageGalleryViewController()
        self.show(imageGalleyVC, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            // first collection view
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            return cellA
        }else {
            
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: cellId1, for: indexPath)
            return cellB
        }
        
    }
    
    
    @objc func backButtonTouched(_ sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    //number of items cv
    // size for each cell
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
