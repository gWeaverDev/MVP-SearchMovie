//
//  BaseVC.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .white
    }
}
