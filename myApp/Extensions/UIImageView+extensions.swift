//
//  UIImageView+extensions.swift
//  myApp
//
//  Created by Mert Karahan on 21.09.2022.
//

import Foundation
import UIKit
import Kingfisher


// For set image.
extension UIImageView{
    func setImage(imageUrl: String) {
        let url = URL(string: imageUrl)
        self.kf.setImage(with: url)
    }
}
