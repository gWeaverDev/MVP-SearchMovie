//
//  DetailVC.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 08.06.2023.
//

import Foundation
import UIKit

final class DetailVC: BaseVC {
    
    var presenter: DetailViewOutput!
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        presenter.getComment()
    }
    
    private func setupLayout() {
        view.addSubviewWithoutAutoresizing(commentLabel)
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            commentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            commentLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
}

extension DetailVC: DetailViewInput {
    func success() {
        //
    }
    
    func failure(_ error: Error) {
        print(error.localizedDescription)
    }
    
    
    func setComment(_ model: Comment?) {
        commentLabel.text = model?.body
    }
}
