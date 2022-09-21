//
//  BaseNetwork.swift
//  Alamofire
//
//  Created by Nima Davarpanah on 3/9/20.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class BaseNetwok {
    static let sharedInstance = BaseNetwok()
    private init() {}
    
    //MARK: - Base Function
    private func loadData(parameters: [String: AnyObject], url: String = "", needToken: Bool = true, method: HTTPMethod = .post, completionHandler: @escaping ((_ data: JSON, _ error: Bool, _ msg: String ) -> ())){
        var finalParameters = parameters
        var final_url = config.baseURL + url
        
        if  needToken {
            finalParameters["token"] =  User.defaultUser.token as AnyObject?
        }
        print(finalParameters)
        
        if #available(iOS 12.0, *) {
            self.internetConnection.checkInternetConnection { (success) in
                if success {
                    Alamofire.request(final_url, method: method, parameters: finalParameters, headers: nil).validate().responseJSON { response in
                        switch response.result {
                        case .success:
                            guard let value = response.result.value, let statusCode = response.response?.statusCode else {
                                completionHandler(err, JSON(), false, "")
                                return
                            }
                            let json = JSON(value)
                            print(json)
                            completionHandler(json, false, json["msg"].stringValue)
                        case .failure(_):
                            completionHandler(JSON(), true, "")
                        }
                    }
                }else {
                    print("No Internet")
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
    //MARK: - Login Services
    func registerAPI(mobile: String, completionHandler: @escaping ((_ error: Bool, _ msg: String ) -> ())) {
        let params =  ["number_phone": mobile, "device_id": self.getDeviceID()]
        
        loadData(parameters: params as [String : AnyObject], url: "sendcode", needToken: false) { (status, json, error, msg) in
            if error {
                completionHandler(0, true, msg)
            } else {
                let success = json["success"].stringValue.strToBool()
                completionHandler(!success, msg)
            }
        }
    }
    
}
