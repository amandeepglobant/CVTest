//
//  EmployeeCVModel.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import Foundation

// Model to hold EmployeeCV response.
public struct EmployeeCVModel: Decodable {
    public let employeeName: String?
    public let position: String?
    public let careerSummary: String?
    public let skills: [String]?
    public let languages: [String]?
    public let careerHistory: [CareerHistoryModel]?
    public let education: [EducationModel]?
}

// Model to hold Career History response.
public struct CareerHistoryModel: Decodable {
    public let companylogo: String
    public let company: String
    public let duration: String
    public let role: String
    public let responsibilities: String
}

// Model to hold Education information response.
public struct EducationModel: Decodable {
    public let course: String
    public let duration: String
    public let college: String
}
