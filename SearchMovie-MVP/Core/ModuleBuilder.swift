//
//  ModuleBuilder.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import UIKit

protocol ModuleBuilderProtocol: AnyObject {
    static func showMainScreen() -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {
    
    static func showMainScreen() -> UIViewController {
        let model = Person(firstName: "George", lastName: "Weaver")
        let view = MainVC()
        let presenter = MainPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
}
