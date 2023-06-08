//
//  MainPresenterTest.swift
//  SearchMovie-MVPTests
//
//  Created by George Weaver on 07.06.2023.
//

import XCTest
@testable import SearchMovie_MVP

class MockView: MainViewProtocol {
    var testText: String?
    func setGreeting(with text: String) {
        self.testText = text
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var model: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        view = MockView()
        model = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, model: model)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        model = nil
        presenter = nil
    }
    
    func testModuleIsNotNill() {
        XCTAssertNotNil(view, "view isn't nil")
        XCTAssertNotNil(model, "model isn't nil")
        XCTAssertNotNil(presenter, "presenter isn't nil")
    }
    
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.testText, "Baz Bar")
        
        presenter.resetLabel()
        XCTAssertEqual(view.testText, "What is your name?")
    }
    
    func testModel() {
        XCTAssertEqual(model.firstName, "Baz")
        XCTAssertEqual(model.lastName, "Bar")
    }

}
