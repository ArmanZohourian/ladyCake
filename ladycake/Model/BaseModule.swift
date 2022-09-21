//
//  BaseModule.swift
//  VesamAcademyInitializerApp_iOS
//
//  Created by Nima Davarpanah on 11/25/19.
//  Copyright © 2019 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import UIKit

class BaseModule {

    static let sharedInstance = BaseModule()
    private init() {}
    
    //MARK: - Variables
    var generalHeightView: CGFloat {
        return CGFloat(45)
    }
    
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    var textfieldHeight: CGFloat {
        return 40.0
    }
    
    var isNewDevice: Bool {
        return UIDevice.isNewDevice()
    }
    
//    var iphoneSE: Bool {
//        return UIDevice.current.iPhoneSE
//    }
    
    
    @objc public static let baseFilePath: String = {
        return (NSHomeDirectory() as NSString).appendingPathComponent("Documents") as String
    }()

    
    //MARK: - Singelton

    lazy var defaults     = UserDefaults.standard
//    lazy var network      = BaseNetwok.sharedInstance
    lazy var controller   = BaseControllerName.sharedInstance
    lazy var urlConfig    = URLConfig.sharedInstance
    lazy var notification = BaseNotification.sharedInstance
    lazy var loader       = Preloader.sharedInstance

    //MARK: - Color Palets
    let background_color      = UIColor(named: "f1f1f1")
    let master_color          = UIColor(named: "0082c8") // Organization color
    let navigation_background = UIColor(named: "f1f1f1")
    let navigation_tint       = UIColor(named: "333333")
    let tint_color            = UIColor(named: "ffffff")
    let green_color           = UIColor(named: "009e4e")
    let blue_color            = UIColor(named: "34bedb")
    let red_color             = UIColor(named: "fd5759")
    let gray_color            = UIColor(named: "d0d0d0")
    let darkGray_color        = UIColor(named: "454545")
    let red_highlight         = UIColor(named: "ef2949")
    let orange_highlight      = UIColor(named: "ffa909")

    
    //MARK: - Date Formatter
    lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    lazy var formatterGregorian: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.calendar = Calendar(identifier: .gregorian)
        return formatter
    }()
    
    lazy var formatterPersian: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.calendar = Calendar(identifier: .persian)
        return formatter
    }()

}

