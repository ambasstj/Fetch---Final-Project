//
//  Recipes__Powered_by_FetchTests.swift
//  Recipes. Powered by FetchTests
//
//  Created by Tevin Jones on 10/18/23.
//
@testable import Recipes__Powered_by_Fetch
import XCTest

final class Recipes__Powered_by_FetchTests: XCTestCase {

    func testViewController_setsTableViewDataSource() throws {
       //Arrange
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesTableViewController")
        let sut = try XCTUnwrap(viewController as? RecipesTableViewController)
        
        //Act
        sut.beginAppearanceTransition(true, animated: false)
        
        //Assert
        XCTAssertTrue(sut.tableViewOutlet.dataSource === sut)
        
    }

    func testViewController_setsTableViewDelegate() throws {
       //Arrange
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RecipesTableViewController")
        let sut = try XCTUnwrap(viewController as? RecipesTableViewController)
        
        //Act
        sut.beginAppearanceTransition(true, animated: false)
        
        //Assert
        XCTAssertTrue(sut.tableViewOutlet.dataSource === sut)
    }
}
