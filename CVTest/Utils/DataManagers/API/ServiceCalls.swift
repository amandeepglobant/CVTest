//
//  ServiceCalls.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import Foundation

class ServiceCalls {

    static func getEmployeeCVFromServer(completion: @escaping (_ result: EmployeeCVModel?) -> Void) {

        let url = URL(string: Constrants.URL.EmployeeCV)
        let requestURL = URLRequest(url: url!)
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60.0 // Set timeout 60 seconds.
        sessionConfig.timeoutIntervalForResource = 60.0
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: requestURL, completionHandler: { data, response, error in

            // Check for the error
            guard error == nil else {
                // Handle error here
                completion(nil)
                return
            }

            // Check for the data
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                // The data is returned in JSON format and needs to be converted into something that swift can work with
                // we are converting it into a model of decodable type.
                let responseModel = try JSONDecoder().decode(EmployeeCVModel.self, from: data)
                completion(responseModel)
            } catch let error as NSError {
                // Handle error here
                print("Failed to load: \(error.localizedDescription)")
                completion(nil)
            }
        })

        task.resume()
    }
}
