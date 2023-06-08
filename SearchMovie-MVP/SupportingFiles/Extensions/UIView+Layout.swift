//
//  UIView+Layout.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import UIKit

extension UIView {
    
    func addSubviewWithoutAutoresizing(_ subviews: UIView...) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
