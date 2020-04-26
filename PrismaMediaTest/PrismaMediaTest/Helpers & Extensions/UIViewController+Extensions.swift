//
//  UIViewController+Extensions.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /*
     Permet de charger les outlets de la vue sans attendre la présentation à l'écran
     */
    func loadOutlets() {
        let _ = view
    }
}
