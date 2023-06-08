//
//  MainPresenter.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import Foundation
import UIKit

protocol MainViewInput: AnyObject {
    func success()
    func failure(_ error: Error)
}

protocol MainViewOutput: AnyObject {
    var comments: [Comment]? { get set }
    init(view: MainViewInput, networkService: NetworkServiceProtocol)
    func getComments()
    func setCells() -> [ReusableView.Type]
}

final class MainPresenter: MainViewOutput {
    weak var view: MainViewInput?
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    
    init(view: MainViewInput, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func setCells() -> [ReusableView.Type] {
        return [UITableViewCell.self, UITableViewCell.self]
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error)
                }
            }
        }
    }
}
