//
//  DataProviderTests.swift
//  ToDoAppTests
//
//  Created by Admin on 25/04/2019.
//  Copyright © 2019 Admins. All rights reserved.
//

import XCTest
@testable import ToDoApp
class DataProviderTests: XCTestCase {

    var sut: DataProvider!
    var tableView: UITableView!
    
    var controller: TaskListViewController!
    
    override func setUp() {
        sut = DataProvider()
        sut.taskManager = TaskManager()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as? TaskListViewController
        
        controller.loadViewIfNeeded()
        
        tableView = controller.tableView
        tableView.dataSource = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfSectionsIsTwo() {
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
    }

    func testNumberOfRowsInSectionsZeroIsTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.taskManager?.add(task: Task(title: "Bar"))

        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

    func testNumberOfRowsInSectionsOneIsDoneTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        sut.taskManager?.checkTask(at: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.taskManager?.add(task: Task(title: "Bar"))
        sut.taskManager?.checkTask(at: 0)

        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    func testCellForRowAtIndexPathReturnsTaskCell() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is TaskCell)
    }
    
    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = sut
        
        mockTableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        sut.taskManager?.add(task: Task(title: "Foo"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mockTableView.cellIsDequeued)
    }
    
    func testCellForRowInSectionZeroCallsConfigure() {
        tableView.register(MockTaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        let task = Task(title: "Foo")
        sut.taskManager?.add(task: task)
        tableView.reloadData()
        
       let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTaskCell
        
        XCTAssertEqual(cell.task, task)
        
    }
    
}

extension DataProviderTests {
    class MockTableView: UITableView {
        var cellIsDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockTaskCell: TaskCell {
        var task: Task?
        
        func configure(withTask task: Task) {
            self.task = task
        }
    }
    
}
