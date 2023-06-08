//
//  MainPresenter.swift
//  SearchMovie-MVP
//
//  Created by George Weaver on 07.06.2023.
//

import Foundation
import UIKit

struct Person {
    let firstName: String
    let lastName: String
}

protocol MainViewProtocol: AnyObject {
    func setGreeting(with text: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, model: Person)
    func showGreeting()
    func resetLabel()
}

final class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let model: Person
    
    init(view: MainViewProtocol, model: Person) {
        self.view = view
        self.model = model
    }
    
    func showGreeting() {
        let greeting = model.firstName + " " + model.lastName
        view.setGreeting(with: greeting)
    }
    
    func resetLabel() {
        view.setGreeting(with: "What is your name?")
    }
}
