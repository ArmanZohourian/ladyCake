//
//  PackagesViewController.swift
//  ladycake
//
//  Created by Arman on 2/22/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class PackagesViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    let cellId = "cellId"
    
    let walletImage : UIImageView = {
          let imageView = UIImageView()
          imageView.image = UIImage(named: "wallet")
          return imageView
      }()
      
      let sumPrice : UILabel = {
          let label = UILabel()
          label.text = "قیمت کل پکیج"
        
        label.sizeToFit()
          return label
      }()
    
    let navBarView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let backButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        return button
    }()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    let buyWholePackView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.layer.cornerRadius = 20.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PackagesCell.self, forCellWithReuseIdentifier: cellId)
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {

        sumPrice.translatesAutoresizingMaskIntoConstraints = false
        walletImage.translatesAutoresizingMaskIntoConstraints = false
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        buyWholePackView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarView)
        view.addSubview(backButton)
        view.addSubview(buyWholePackView)
        view.addSubview(collectionView)
        buyWholePackView.addSubview(walletImage)
        buyWholePackView.addSubview(sumPrice)
        // Navbar constraints
        navBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        navBarView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        navBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        navBarView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        // back button constraints
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +7).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: +30).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //butwhopackage button constraints , gotta make a view
        buyWholePackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +50).isActive = true
        buyWholePackView.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: +10).isActive = true
        buyWholePackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        buyWholePackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // Collection view Constrain
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +10).isActive = true
        collectionView.topAnchor.constraint(equalTo: buyWholePackView.bottomAnchor, constant: +10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        // elements inside the buy whole pack view
            // wallet image
        walletImage.topAnchor.constraint(equalTo: buyWholePackView.topAnchor, constant: +10).isActive = true
        walletImage.trailingAnchor.constraint(equalTo: buyWholePackView.trailingAnchor, constant: -50).isActive = true
        walletImage.bottomAnchor.constraint(equalTo: buyWholePackView.bottomAnchor, constant: -10).isActive = true
        walletImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
            // price label
        sumPrice.leadingAnchor.constraint(equalTo: buyWholePackView.leadingAnchor, constant: +40).isActive = true
        sumPrice.topAnchor.constraint(equalTo: buyWholePackView.topAnchor, constant: +10).isActive = true
        sumPrice.trailingAnchor.constraint(equalTo: walletImage.leadingAnchor, constant: +10).isActive = true
        sumPrice.bottomAnchor.constraint(equalTo: buyWholePackView.bottomAnchor, constant: -10).isActive = true
        
        
        
        
        
        
        
    }
    // number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    // size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 170, height: 170)
      }
    //contents of the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
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
