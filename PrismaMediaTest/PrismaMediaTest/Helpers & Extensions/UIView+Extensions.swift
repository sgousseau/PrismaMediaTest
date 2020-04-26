//
//  UIView+Extensions.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//


import Foundation
import UIKit

extension UIView {
    func fade(duration: TimeInterval = 0.3) -> Self {
        self.layer.fade(duration: duration)
        return self
    }
}

