//
//  User.swift
//  VesamAcademyInitializerApp_iOS
//
//  Created by Nima Davarpanah on 11/24/19.
//  Copyright © 2019 Mohammad Davarpanah. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject, NSCoding {
    
    // Mark: -Private var
    
    
    // Mark: -Public var
    static var defaultUser: User = User.restore()
    
//    var cart: Cart = Cart.shared
    var id: String = ""
    var token: String = ""
    
    // MARK: -Function
    init(id: String, token: String) {
        self.id = id
        self.token = token
    }
    
    override init(){
        
    }
    
    // MARK: NSCoding
    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeObject(forKey: "id") as! String
        self.token = decoder.decodeObject(forKey: "token") as! String
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.token, forKey: "token")
//        aCoder.encode(self.cart, forKey: "cart")
    }
    
    func saveToDisk(){
        
        let ud = BaseModule.sharedInstance.defaults
        ud.set(NSKeyedArchiver.archivedData(withRootObject: self), forKey: "user")
        ud.set(true, forKey: "IS_LOGIN")
        ud.synchronize()
        User.defaultUser = User.restore()
    }
    
    static func restore() -> User {
        let ud = BaseModule.sharedInstance.defaults
        guard let decodedNSData = ud.object(forKey: "user") as? NSData,
            let user = NSKeyedUnarchiver.unarchiveObject(with: decodedNSData as Data) as? User
            else {
                return User.guest()
        }
        
        return user
        
    }
    
    func removeDisk(){
        
        let ud = BaseModule.sharedInstance.defaults
        ud.removeObject(forKey: "user")
        ud.synchronize()
        User.defaultUser = User.guest()
//        for item in Cart.shared.cartItems{
//            item.count = 0
//        }
        User.defaultUser.saveToDisk()
//        Cart.shared.reloadData()
    }
    
    func empty() -> Bool{
        
        return self.id == "" ? true : false
    }
    
    
    static func guest() -> User{
        
        let user = User()
        return user
    }
    
}
