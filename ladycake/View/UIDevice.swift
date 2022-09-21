//
//  UIDevice.swift
//  ladycake
//
//  Created by Arman on 2/18/20.
//  Copyright © 2020 Arman. All rights reserved.
//

import Foundation
import UIKit
// Identifying the device's resolution
extension UIDevice {
    static func isNewDevice() -> Bool {
        return (UIScreen.main.bounds.height / UIScreen.main.bounds.width) > 2.0
    }
}
