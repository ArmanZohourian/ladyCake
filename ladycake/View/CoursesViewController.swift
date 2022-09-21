//
//  CoursesViewController.swift
//  ladycake
//
//  Created by Arman on 2/20/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout  {
    
    let walletImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wallet")
        return imageView
    }()
    
    let sumPrice : UILabel = {
        let label = UILabel()
        label.text = "قیمت کل پکیج"
        return label
    }()
    
    // cell ID
    let cellId = "cellId"
    //Declaring collection view
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        return cv
    }()
    let navBarView = UIView()
    let backButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 1, green: 0.3769546563, blue: 0.5458284009, alpha: 0.8470588235)
        return button
    }()
    var titleLable : UILabel = {
        let label = UILabel()
        label.text = "دوره ها "
        label.textColor = UIColor.black
        return label
    }()
    let buyWholeCourse : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = 10.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CoursesCell.self, forCellWithReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
    }
    
    
    
    func setUpElements() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        buyWholeCourse.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navBarView)
        view.addSubview(backButton)
        view.addSubview(titleLable)
        view.addSubview(collectionView)
        view.addSubview(buyWholeCourse)
        
        
        navBarView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
//        navBarView.frame = CGRect(x: 0, y: 7, width: self.view.frame.width, height: 90)
        navBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        navBarView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        navBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        navBarView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        // Back button Constraints
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +10).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: +40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // back button add target
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        // Label Constraints
        titleLable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: -10).isActive = true
        titleLable.topAnchor.constraint(equalTo: self.view.topAnchor , constant: +40).isActive = true
        titleLable.widthAnchor.constraint(equalToConstant: 50).isActive = true
        titleLable.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //Buy the whole course button constraints
        buyWholeCourse.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +20).isActive = true
        buyWholeCourse.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: +10).isActive = true
        buyWholeCourse.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        buyWholeCourse.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // Collection view constraints
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +5).isActive = true
        collectionView.topAnchor.constraint(equalTo: buyWholeCourse.bottomAnchor, constant: +10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true 
    }
    // size for each cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170  , height: 80)
    }
    //number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    //contents of the cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    @objc func goBack() {
        
        
        
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
