//
//  ModuleBuilder.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    static func createMainScreen() -> UIViewController
    static func createDetailScreen(model: Comment?) -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {
    
    static func createMainScreen() -> UIViewController {
        let view = MainVC()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailScreen(model: Comment?) -> UIViewController {
        let view = DetailVC()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, model: model)
        view.presenter = presenter
        return view
    }
}
