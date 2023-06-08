//
//  MainVC.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import UIKit

final class MainVC: BaseVC {
    
    var presenter: MainPresenter!
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "What is your name?"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 10
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.imageView?.tintColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupActions()
    }
    
    private func setupActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubviewWithoutAutoresizing(label, button, resetButton)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -20),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: 28),
            
            resetButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resetButton.widthAnchor.constraint(equalToConstant: 25),
            resetButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        self.presenter.showGreeting()
    }
    
    @objc
    private func resetTapped(_ sender: UIButton) {
        self.presenter.resetLabel()
    }
}

extension MainVC: MainViewProtocol {
    
    func setGreeting(with text: String) {
        self.label.text = text
    }
}

