//
//  ImageGalleryViewController.swift
//  ladycake
//
//  Created by Arman on 2/29/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()

    let viewTitle : UILabel = {
           let label = UILabel()
           label.text = " گالری عکس ها  "
           label.backgroundColor = UIColor.black
           label.adjustsFontSizeToFitWidth = true
           label.textAlignment = .right
           label.textColor = UIColor.white
           label.translatesAutoresizingMaskIntoConstraints = false
           
           return label
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
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(imageGalleryCell.self, forCellWithReuseIdentifier: cellId)
        view.backgroundColor = UIColor.white
//        view.backgroundColor = UIColor.orange
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navView)
        navView.addSubview(viewTitle)
        navView.addSubview(backButton)
        navView.addSubview(collectionView)
        
        // Constraints
        //Nav bar view
        navView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        navView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: +0).isActive = true
        navView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        navView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        viewTitle.topAnchor.constraint(equalTo: navView.topAnchor, constant: +20).isActive = true
        viewTitle.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: -10).isActive = true
        viewTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewTitle.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        backButton.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: +10).isActive = true
        backButton.topAnchor.constraint(equalTo: navView.topAnchor, constant: +30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        backButton.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: -10).isActive = true
        
        //Collection View
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: navView.bottomAnchor, constant: +2).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    @objc func backButtonTouched(_ sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
