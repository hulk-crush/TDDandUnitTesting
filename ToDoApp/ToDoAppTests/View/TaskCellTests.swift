//
//  TaskCellTests.swift
//  ToDoAppTests
//
//  Created by Admin on 06/05/2019.
//  Copyright © 2019 Admins. All rights reserved.
//

import XCTest
@testable import ToDoApp
class TaskCellTests: XCTestCase {
    var cell: TaskCell!
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as! TaskListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCellHasTitleLable() {
        
        XCTAssertNotNil(cell.titleLabel)
    }

    func testCellHasTitleLabelInContentView() {
       
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    
}


extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
