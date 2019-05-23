//
//  CVTestTests.swift
//  CVTestTests
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import XCTest
@testable import CVTest

class CVTestTests: XCTestCase {
    
    fileprivate lazy var controller: EmployeeCVViewController = createEmployeeCVViewController()
    
    override func setUp() {
        super.setUp()
        _ = controller.view // force to load UI
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: Test methods
    func testValidEmployeeCVData() {
        // Load correct json into model
        loadCorrectJson(fileName: Constrants.JSONFile.EmployeeCVValid)
        
        // Check model values
        XCTAssertEqual(controller.empModel?.employeeName, "Amandeep Singh")
        XCTAssertEqual(controller.empModel?.position, "Sr. iOS application developer")
        XCTAssertEqual(controller.empModel?.skills?.count, 2)
        XCTAssertEqual(controller.empModel?.careerHistory?.count, 4)
        XCTAssertEqual(controller.empModel?.languages?.count, 3)
        XCTAssertEqual(controller.empModel?.education?.count, 1)
    }
    
    func testInValidEmployeeCVData() {
        // Load incorrect json into model
        loadIncorrectJson(fileName: Constrants.JSONFile.EmployeeCVInvalid)
        
        // Check model values existence
        XCTAssertEqual(controller.empModel?.employeeName, nil)
        XCTAssertEqual(controller.empModel?.position, nil)
        XCTAssertEqual(controller.empModel?.skills, nil)
        XCTAssertEqual(controller.empModel?.careerHistory?.count, nil)
        XCTAssertEqual(controller.empModel?.languages?.count, nil)
        XCTAssertEqual(controller.empModel?.education?.count, nil)
        
        // Check model values
        XCTAssertNotEqual(controller.empModel?.employeeName, "Amandeep Singh")
        XCTAssertNotEqual(controller.empModel?.position, "Sr. iOS application developer")
        XCTAssertNotEqual(controller.empModel?.skills?.count, 2)
        XCTAssertNotEqual(controller.empModel?.careerHistory?.count, 4)
        XCTAssertNotEqual(controller.empModel?.languages?.count, 3)
        XCTAssertNotEqual(controller.empModel?.education?.count, 1)
    }
    
    //MARK: Private methods
    // Method to load EmployeeCVViewController
    fileprivate func createEmployeeCVViewController() -> EmployeeCVViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "EmployeeCVViewController")
        let viewController = controller as? EmployeeCVViewController
        return viewController!
    }
    
    // Method to parse JSON from bundle
    fileprivate func parseEmployeeCVResponse(filename: String, completion:@escaping (_ result: EmployeeCVModel?, _ error: Error?) -> Void) {
        guard let data =  getDataSource(filename: filename) else { return }
        do {
            let employeeData = try JSONDecoder().decode(EmployeeCVModel.self, from: data)
            completion(employeeData, nil)
        } catch let error as NSError {
            completion(nil, error)
        }
    }
    
    // Method to get data from JSON
    fileprivate func getDataSource(filename: String) -> Data? {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json"), let data = NSData(contentsOfFile: path) else {
            return nil
        }
        return data as Data
    }
    
    // Method to load correct json into model
    fileprivate func loadCorrectJson(fileName: String) {
        getEmployeeData(fileName: fileName)
    }
    
    // Method to load incorrect json into model
    fileprivate func loadIncorrectJson(fileName: String) {
        getEmployeeData(fileName: fileName)
    }
    
    // Method to load JSON from bundle
    fileprivate func getEmployeeData(fileName: String) {
        controller.empModel = nil
        parseEmployeeCVResponse(filename: fileName) { [weak self] (empModel, error) in
            if error == nil {
                self?.controller.empModel = empModel
            }
        }
    }
}
