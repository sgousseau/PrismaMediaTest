//
//  UIImageView+Extensions.swift
//  PrismaMediaTest
//
//  Created by Sébastien Gousseau on 26/04/2020.
//  Copyright © 2020 greencode. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(_ urlString: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = urlString.toURL(), let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.fade().image = image
                    }
                }
            }
        }
    }
}
