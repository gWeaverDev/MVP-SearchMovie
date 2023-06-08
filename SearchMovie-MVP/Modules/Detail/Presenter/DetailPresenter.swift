//
//  DetailPresenter.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 08.06.2023.
//

import Foundation

protocol DetailViewInput: AnyObject {
    func setComment(_ model: Comment?)
    func success()
    func failure(_ error: Error)
}

protocol DetailViewOutput: AnyObject {
    init(view: DetailViewInput, networkService: NetworkServiceProtocol, model: Comment?)
    func getComment()
}

final class DetailPresenter: DetailViewOutput {
    
    weak var view: DetailViewInput?
    let networkService: NetworkServiceProtocol
    let model: Comment?
    
    init(view: DetailViewInput, networkService: NetworkServiceProtocol, model: Comment?) {
        self.view = view
        self.networkService = networkService
        self.model = model
    }
    
    func getComment() {
        view?.setComment(model)
    }
    
}
