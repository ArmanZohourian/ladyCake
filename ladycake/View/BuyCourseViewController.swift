//
//  BuyCourseViewController.swift
//  ladycake
//
//  Created by Arman on 2/20/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class BuyCourseViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    //Creating Scroll View
    let scrollView = UIScrollView()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: (self.collectionView.frame.maxY) + 100)
    }
    // cake image , UIimage
    
    var cakeImages = [UIImageView]()
    
    let topCakeImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cake-image")
        imageView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return imageView
    }()
    
    
    let slideShow : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor.systemBlue
        scrollView.layer.cornerRadius = 20
        scrollView.showsHorizontalScrollIndicator = true 
        return scrollView
       }()
       
    
    //favorite button , button
    let favoriteButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return button
    }()
    //back button , button
    let backButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8951062817, green: 0.504482873, blue: 0.08875234549, alpha: 1)
        return button
    }()
    // buy the course button , button
    let buyCourseButton : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    
    let cellId = "cellId"
    let slideShowId = "slideId"
    // Declaring the Collection view
    let collectionView : UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.orange
            return cv
            
        }()
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        slideShow.contentSize = CGSize(width:  CGFloat(cakeImages.count), height: 200)
    }
    
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        slideShow.delegate = self
        collectionView.register(BuyCourseCell.self, forCellWithReuseIdentifier: cellId)
        super.viewDidLoad()
        setUpElemenets()
        // Do any additional setup after loading the view.
    }
    
    func setUpElemenets() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        buyCourseButton.translatesAutoresizingMaskIntoConstraints = false
        topCakeImage.translatesAutoresizingMaskIntoConstraints = true
//        view.backgroundColor = UIColor.blue
//        self.view.addSubview(scrollView)
        self.view.addSubview(slideShow)
        self.view.addSubview(topCakeImage)
        self.view.addSubview(collectionView)
        self.view.addSubview(backButton)
        self.view.addSubview(favoriteButton)
        self.view.addSubview(buyCourseButton)
 
        //Constraining Scroll View
//        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        //constraining back button
        backButton.leadingAnchor.constraint(equalTo : self.view.leadingAnchor , constant: +10).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: +40).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        // constraining favorite button
        favoriteButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: -10 ).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: self.view.topAnchor , constant: +40).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        //Constraining buy course button
        buyCourseButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +15).isActive = true
        buyCourseButton.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant : +60).isActive = true
        buyCourseButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        buyCourseButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
        // Constraining Slide show , Cake images
        slideShow.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        slideShow.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        slideShow.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        slideShow.heightAnchor.constraint(equalToConstant: 200).isActive = true
        

        topCakeImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        topCakeImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topCakeImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: 0).isActive = true
        topCakeImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
        //Constraining Collection view
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: +10).isActive = true
        collectionView.topAnchor.constraint(equalTo: slideShow.bottomAnchor, constant: +10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

        // Targets
        buyCourseButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buyTheCourse)))
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        favoriteButton.addTarget(self, action: #selector(addToFavoriets), for: .touchUpInside)
        
        
        
    }
    // number of the items of the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // gotta be an appended array
        return 10

    }
    
    // size for every item in the collection view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

             return CGSize(width: collectionView.frame.width, height: 100)
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 
    }
    
    //Contents of the Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            //        cell.backgroundColor = UIColor.red
            return cell
        
       
    }
    
    //Button action functions
    @objc func buyTheCourse() {
        
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addToFavoriets() {
        
    }
    
    @objc func slideScroll() {
        
        
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
