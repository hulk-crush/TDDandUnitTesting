//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by Admin on 23/04/2019.
//  Copyright © 2019 Admins. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDoApp
class LocationTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitSetsCoordinates() {
        let coordinate = CLLocationCoordinate2D(latitude: 1,
                                                longitude: 2)
        
        let location = Location(name: "Foo",
                                coordinate: coordinate)
    }

}
