//
//  buyCourseTabBarController.swift
//  ladycake
//
//  Created by Arman on 2/25/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import UIKit

class buyCourseTabBarController: UITabBarController , UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {

        setUpTapBar()
        self.delegate = self
        
        
    }
    
    func setUpTapBar() {
        
        let firstVC = BuyCourseViewController()
        let secondVC = SimilarProductsViewController()
        let thirdVC =   ExplenationsViewController()
        let fourthVC = UserOutcomesViewController()
        
//        let firstVCIcon = UITabBarItem(title: "محصولات مشابه", image: UIImage(named: "similarities"), tag: 0)
//        let secondVCIcon = UITabBarItem(title: "نتایج کاربران", image: UIImage(named: "outcomes"), tag: 0)
//        let thirdVCIcon = UITabBarItem(title: "فایل", image: UIImage(named: "file"), tag: 0)
//        let fourthVCIcon = UITabBarItem(title: "توضیحات", image: UIImage(named: "more"), tag: 0)
//
//        // selected image
//        firstVCIcon.selectedImage = UIImage(named: "comare-selected")
//        secondVCIcon.selectedImage = UIImage(named: "outcomes-selected")
//        thirdVCIcon.selectedImage = UIImage(named: "file-selected")
//        fourthVCIcon.selectedImage = UIImage(named: "more-selected")
        
        
        let firstVCIcon = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let secondVCIcon = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        let thirdVCIcon = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let fourthVCIcon = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        let views = [firstVC , secondVC , thirdVC , fourthVC]
        firstVC.tabBarItem = firstVCIcon
        secondVC.tabBarItem = secondVCIcon
        thirdVC.tabBarItem = thirdVCIcon
        fourthVC.tabBarItem = fourthVCIcon
        
        self.viewControllers = views
        
        
        
        
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
