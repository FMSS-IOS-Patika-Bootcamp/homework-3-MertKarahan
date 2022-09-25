//
//  UIViewController+extensions.swift
//  myApp
//
//  Created by Mert Karahan on 25.09.2022.
//

import Foundation
import UIKit

// Make alert function for every need situation.
extension UIViewController {
    func makeAlert(alertTitle:String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
