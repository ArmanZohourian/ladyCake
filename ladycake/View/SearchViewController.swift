//
//  SearchViewController.swift
//  ladycake
//
//  Created by Arman on 2/16/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController , UISearchBarDelegate {
    

    let searchBar = UISearchBar()
    let backkButton = UIButton()
    let searchTextLabel : UILabel = {
       let label = UILabel()
        label.text = "متن خود را برای جستجو وارد کنید "
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements() {
        // setting the background to the main view
        let backgroundImageView : UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(named: "backGround")
            imageView.image = image
            return imageView
            
        }()
        self.view.addSubview(backgroundImageView)
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        searchTextLabel.translatesAutoresizingMaskIntoConstraints = false 
        backkButton.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        let navBarView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 87))
        self.view.addSubview(navBarView)
        self.view.addSubview(searchTextLabel)
//        navBarView.backgroundColor = UIColor.black
        navBarView.addSubview(searchBar)
        navBarView.addSubview(backkButton)
        //Customizing Search bar
        searchBar.barTintColor = #colorLiteral(red: 0.8951062817, green: 0.504482873, blue: 0.08875234549, alpha: 1)
        searchBar.backgroundImage = UIImage(named: " ")
        searchBar.placeholder = "جستجو"
        
        
        // constraining searchBar
        searchBar.leadingAnchor.constraint(equalTo: backkButton.trailingAnchor).isActive = true
        navBarView.topAnchor.constraint(equalTo: navBarView.topAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
        // Constraining back button
        backkButton.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor , constant: 0).isActive = true
        backkButton.topAnchor.constraint(equalTo: navBarView.topAnchor).isActive = true
        backkButton.trailingAnchor.constraint(equalTo: searchBar.leadingAnchor).isActive = true
        backkButton.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor).isActive = true
        backkButton.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        backkButton.addTarget(self, action: #selector(goBackToMainView), for: .touchUpInside)
        // Constraining search label
        searchTextLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant:  +80).isActive = true
        searchTextLabel.topAnchor.constraint(equalTo: navBarView.bottomAnchor , constant: -10).isActive = true
        searchTextLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        searchTextLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        self.view.addSubview(navBarView)

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        self.view.addSubview(searchTextLabel)
//        self.view.addSubview(searchBar)
//        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: 44))
//        view.addSubview(navBar)
//        let navItem = UINavigationItem()
//        let RightBarButtonItem = UIBarButtonItem(customView: searchBar)
//        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doSomething))
//        navItem.rightBarButtonItem = RightBarButtonItem
//        navItem.leftBarButtonItem = leftBarButtonItem
//        navBar.setItems([navItem], animated: false)
//        //Back button
//        backkButton.setBackgroundImage(UIImage(named: "back-bg"), for: UIControl.State.normal)
//
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        searchTextLabel.translatesAutoresizingMaskIntoConstraints = false
//
//
//        // Search text label (mid screen)
//        searchTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 72).isActive = true
//        searchTextLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
//        searchTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        searchTextLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        self.navigationItem.titleView = searchBar
//        // Search bar Customizition
//        searchBar.delegate = self
//        searchBar.placeholder = "جستجو"
//        searchBar.backgroundImage = UIImage(named: "search-backgroundimage")
//        searchBar.scopeBarBackgroundImage = UIImage(named: "seach-button-icon")
//        searchBar.backgroundColor = #colorLiteral(red: 0.8951062817, green: 0.504482873, blue: 0.08875234549, alpha: 1)
////        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor ).isActive = true
////        searchBar.topAnchor.constraint(equalTo: view.topAnchor , constant:  +10).isActive = true
////        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
////        searchBar.heightAnchor.constraint(equalToConstant: 100).isActive = true
////
//
        
    }
    
    
    func searchBarTapped() {
        UIView.animate(withDuration: 0.5) {
            self.searchTextLabel.alpha = 0
        }
      
        
    }

    @objc func goBackToMainView() {
        // Navigate to the Home view
        
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
