//
//  Pizza_ClientTests.swift
//  Pizza ClientTests
//
//  Created by Ernie Lail on 12/26/18.
//  Copyright © 2018 Development. All rights reserved.
//

import XCTest
@testable import Pizza_Client

class Pizza_ClientTests: XCTestCase {

    
    let toppingVM = ToppingListViewModel()

    let pizzaDetailVM = PizzaDetailViewModel()

    let pizzaListVM = PizzaListViewModel()
    
    let requestHandle = RequestHandler()

    func testVMs(){
        toppingVM.updateData()
        pizzaDetailVM.updateData(pizzaID: 1)
        pizzaListVM.updateData()
    }
    
    func testRequests(){
        
        requestHandle.addToppingToPizza(completion: { (result) in
            print(result)
        }, pizzaID: 0, toppingID: 1)
        
        requestHandle.returnAvailablePizzas { (result) in
            print(result)
        }
        
        requestHandle.returnAvailableToppings { (result) in
            print(result)
        }
        
        requestHandle.returnToppingsByID(completion: { (result) in
            print(result)
        }, id: 0)
        
    }
    
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
