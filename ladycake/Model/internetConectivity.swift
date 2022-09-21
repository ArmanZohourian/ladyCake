//
//  internetConectivity.swift
//  ladycake
//
//  Created by Arman on 3/14/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import Alamofire

class InternetConectivity {
    
    static var isInternetConnected: Bool {
        
        return NetworkReachabilityManager()?.isReachable ?? false 
    }
}
