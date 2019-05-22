//
//  Constants.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import Foundation

struct Constrants {
    struct URL {
        static let EmployeeCV = "https://gist.githubusercontent.com/amandeepglobant/b895142afc7367c33b8afafd47d86146/raw/6b6b8c4e6155914b5fed6166f0e1009055e5a1b7/EmployeeCV.json"
    }
    
    struct CellIdentifier {
        static let EmployeeInfoCell = "EmployeeInfoCell"
        static let CareerHistoryCell = "CareerHistoryCell"
        static let EducationInfoCell = "EducationInfoCell"
    }
    
    struct JSONFile {
        static let EmployeeCVValid = "EmployeeCVValid"
        static let EmployeeCVInvalid = "EmployeeCVInvalid.json"
    }
    
    static let SectionTitles = ["Employee name", "Employee position", "Career Summary", "Summary of Qualifications", "Languages", "Career History", "Education"]
    static let Name = "Name"
    static let Position = "Position"
    static let About = "About"
    static let EmptyTableView = "No Data loaded\nPlease pull to refresh"
}
