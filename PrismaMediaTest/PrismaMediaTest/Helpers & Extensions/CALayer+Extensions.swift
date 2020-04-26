//
//  CALayer+Extensions.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//


import Foundation
import UIKit

extension CALayer {
    
    /*
    Effet de fondu
    */
    func fade(duration: TimeInterval) {
        let transition: CATransition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        add(transition, forKey: "fade")
    }
}
