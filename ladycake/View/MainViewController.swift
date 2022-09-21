//
//  ViewController.swift
//  ladycake
//
//  Created by Arman on 2/16/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class MainViewController: UIViewController {

//    let howToUseTheAppButton = UIButton()
//    let shopButton = UIButton()
//    let myInstructionsButton = UIButton()
    // adding a offset
//    let imageView = UIImageView(image: backGroundImage)
    
    
    
    var buttons = [UIButton]()
    let buttonNames = ["راهنمای استفاده از اپ","آموزش ها ","آموزش های من ","فروشگاه","","دانلود های من ","نتایج هنر جویان ","پیگیری سفارشات","دوره ها "]
    var lastButtonGenerated : UIButton?
    let buttonIcons = [UIImage]()
    let mainMenuScrollView = UIScrollView()
    let iconNames = ["icon1" , "icon2","icon3","icon4","icon5","icon6","icon7","icon8"]
    let logoPic = UIImage(named: "Web 1080")
    let sideMenuLogo = "side-icon"
    let blackTransparentView = UIView()
    
    
    lazy var networkAPI = BaseNetwok.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.networkAPI.registerAPI(mobile: "09914728289") { (err, msg) in
//            if !err {
//                print("success")
//            }else {
//                print("failed")
//            }
//        }
        
        self.networkAPI.firstPageInitilization { (err, msg) in
            if !err {
                print("Success")
            } else {
                print("Faild")
            }
        }
        // Do any additional setup after loading the view.
        settingUpElements()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.mainMenuScrollView.contentSize = CGSize(width: self.view.frame.width, height: (self.lastButtonGenerated?.frame.maxY)! + 100)
        
    }

    private func settingUpNavBarElements() {
        let sideMenuButton = UIButton(type: .system)
        sideMenuButton.setImage(UIImage(named: "side-icon"), for: .normal)
        sideMenuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sideMenuButton)
        
        let ladyCakeLogo = UIImageView(image: UIImage(named: "LadyCakeLogo"))
        ladyCakeLogo.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ladyCakeLogo)
        
    }
    
    private func settingUpElements() {
        
        var tagId = 0
        
        let backgroundView = UIImageView(frame: self.view.frame)
        //Declaring and positioning the main logo
//        let backgroundsView = ["bg-big" , "bg"]
        if UIDevice.isNewDevice() {
            
            backgroundView.image = UIImage(named: "bg-big")
            
        }else {
            
            backgroundView.image = UIImage(named: "bg")
            
        }
//        let backGroundView = UIImageView(image: UIImage(named: "bg-big"))
        view.addSubview(backgroundView)
        let logoView = UIImageView(image: logoPic)
       
//
        
        // NOTE : Add the scroll view to the view before constraining it , otherwise crash happens
        //Scroll View Configuration
        self.view.addSubview(mainMenuScrollView)
        // Constraining Programmaticly
        self.mainMenuScrollView.translatesAutoresizingMaskIntoConstraints = false
        //Scroll View Constrains
        self.mainMenuScrollView.leadingAnchor.constraint(equalTo : self.view.leadingAnchor).isActive = true
        self.mainMenuScrollView.topAnchor.constraint(equalTo : self.view.topAnchor).isActive = true
        self.mainMenuScrollView.bottomAnchor.constraint(equalTo : self.view.bottomAnchor).isActive = true
        self.mainMenuScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mainMenuScrollView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0)
        // Declaring side button
        let sideButton = UIButton()
        sideButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        sideButton.translatesAutoresizingMaskIntoConstraints = false
        self.mainMenuScrollView.addSubview(sideButton)
        sideButton.setBackgroundImage(UIImage(named: sideMenuLogo), for: UIControl.State.normal)
        sideButton.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        sideButton.addTarget(self, action: #selector(sideMenuTapped), for: .touchUpInside)
        sideButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        
        // Declaring Search button
        let searchButton = UIButton()
        self.mainMenuScrollView.addSubview(searchButton)
       
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setBackgroundImage(UIImage(named: "search-icon"), for: UIControl.State.normal)
        searchButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        searchButton.frame = CGRect(x: view.frame.maxX - 10, y: 0, width: 1, height: 1)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        self.mainMenuScrollView.addSubview(logoView)
        logoView.translatesAutoresizingMaskIntoConstraints = false
//               logoView.frame = CGRect(x: 0, y: 0, width: 420, height: 200)
               logoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 0).isActive = true
               logoView.topAnchor.constraint(equalTo: self.view.topAnchor , constant:  0 ).isActive = true
               logoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant:  0).isActive = true
            logoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
//        searchButton.topAnchor.constraint(equalTo: self.mainMenuScrollView.topAnchor, constant: 0).isActive = true
//        searchButton.trailingAnchor.constraint(equalTo: self.mainMenuScrollView.trailingAnchor, constant: -10).isActive = true
//        searchButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        searchButton.leadingAnchor.constraint(equalTo: sideButton.trailingAnchor).isActive = true
//        searchButton.topAnchor.constraint(equalTo: self.mainMenuScrollView.topAnchor).isActive = true
//        searchButton.trailingAnchor.constraint(equalTo: self.mainMenuScrollView.trailingAnchor).isActive = true
        
        
        
        
        
//        sideButton.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 2).isActive = true
//        sideButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor ,constant: 0 ).isActive = true
//        sideButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
//
        
        // Buttons Configurations
        
        for eachButton in 0...7 {
            let generateButton = UIButton()
            generateButton.translatesAutoresizingMaskIntoConstraints = false
            mainMenuScrollView.addSubview(generateButton)
            generateButton.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)
            generateButton.setBackgroundImage(UIImage(named: iconNames[eachButton]), for: UIControl.State.normal)
            generateButton.sizeToFit()
            generateButton.titleLabel?.lineBreakMode = .byWordWrapping
            generateButton.titleLabel?.numberOfLines = 0
            generateButton.titleLabel?.textAlignment = .center
            generateButton.contentVerticalAlignment = .center
            generateButton.contentHorizontalAlignment = .center
            generateButton.addTarget(self, action: #selector(buttonsTouched(_:)), for: .touchUpInside)
            generateButton.tag = tagId
            tagId += 1
//           x generateButton.setTitle(buttonNames[eachButton], for: UIControl.State.normal)
            // TODO : Adding the images to each button
//            generateButton.setBackgroundImage(, for: UIControl.State.normal)
            // adding a condtion to indicate the postion of the button
                // if the new button is on the left side
            if eachButton % 2 == 0 {
                generateButton.topAnchor.constraint(equalTo : mainMenuScrollView.topAnchor, constant: CGFloat((eachButton + 1) * 100)).isActive = true
                generateButton.leadingAnchor.constraint(equalTo : view.leadingAnchor, constant: 40).isActive = true
                generateButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
                generateButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
//                generateButton.frame.origin.x += buttonOffset
            } // if the new button is on the right side
             else {
                generateButton.topAnchor.constraint(equalTo : mainMenuScrollView.topAnchor, constant: CGFloat((eachButton) * 100) ).isActive = true
                generateButton.trailingAnchor.constraint(equalTo : view.trailingAnchor, constant: -40).isActive = true
                generateButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
                generateButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
//                generateButton.frame.origin.y += buttonOffset
                
            }
            // adding the generated button to the buttons array
            
            buttons.append(generateButton)
            lastButtonGenerated = generateButton
        }

        
        
        
    }
    
    @objc func searchButtonTapped() {
        
        self.show(SearchViewController(), sender: self)
    }
    
    
    @objc func buttonsTouched(_ sender : UIButton) {
        switch sender.tag {
        case 0:
            self.show(buyCourseTabBarController(), sender: self)
            print("amozesh ha ")
        case 1 :
//            self.show
            print("my downloads")
        case 2 :
            print("guid to use app")
        case 3 :
            self.show(ArtistsResultsViewController(), sender: self)
            print("result")
        case 4 :
            print("shop")
        case 5 :
            print("order")
        case 6 :
            print("fresehs")
        case 7 :
            print("my instructs")
        default:
            print("none of the buttons been clicked")
        }
//        let vc = BuyCourseViewController()
////        vc.modalPresentationStyle = .fullScreen
//        self.show(vc, sender: self)
        
        
//            print("Button Touched")
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextVC = storyBoard.instantiateViewController(withIdentifier: "nextVC") as! buyCourseTabBarController
//        self.navigationController?.pushViewController(nextVC, animated: true)
        
//        self.present(nextVC, animated: true , completion: nil)

//        navigationController?.pushViewController(, animated: true)
        
    }
    
    let sideMenu = menuLauncher()
    
    @objc private func sideMenuTapped() {
        
        // Launch the side menu
        sideMenu.sideMenuTapped()
        
        
    }
}

