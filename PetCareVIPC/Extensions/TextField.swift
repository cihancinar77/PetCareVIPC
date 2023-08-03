//
//  TextField.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 5.07.2023.
//

import UIKit

extension UITextField {
    func setPlaceholderTextColor(_ color: UIColor) {
        guard let placeholder = placeholder else {
            return
        }
        
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
