//
//  EmployeeCVViewController.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import UIKit

class EmployeeCVViewController: UIViewController {
    
    var empModel: EmployeeCVModel? = nil
    @IBOutlet weak var tableViewCV: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(EmployeeCVViewController.handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Methods calling
        setupUI()
        serviceCallToGetEmployeeCV()
    }
    
    fileprivate func setupUI() {
        // Set refresh control on tableview
        tableViewCV.tableFooterView = UIView()
        tableViewCV.addSubview(self.refreshControl)
    }
    
    fileprivate func serviceCallToGetEmployeeCV() {
        ServiceCalls.getEmployeeCVFromServer { [weak self]  (result) in
            self?.empModel = result
            // Reload tableview in main thread
            DispatchQueue.main.async(execute: {
                self?.tableViewCV.delegate = self
                self?.tableViewCV.dataSource = self
                self?.tableViewCV.reloadData()
            })
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        serviceCallToGetEmployeeCV()
        refreshControl.endRefreshing()
    }
}

extension EmployeeCVViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constrants.SectionTitles[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.empModel == nil {
            let bgView = CommonLogicClass.showEmptyTableViewLabel(size: self.view.bounds.size, title: Constrants.EmptyTableView)
            tableView.backgroundView = bgView
            tableView.separatorStyle = .none
            return 0
        } else {
            return 7
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2:
            return 1
        case 3:
            return empModel?.skills?.count ?? 0
        case 4:
            return empModel?.languages?.count ?? 0
        case 5:
            return empModel?.careerHistory?.count ?? 0
        default:
            return empModel?.education?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0,1,2,3,4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constrants.CellIdentifier.EmployeeInfoCell) as? EmployeeInfoCell
            guard let empInfoCell = cell else { return UITableViewCell() }
            guard let empInfo = empModel else { return empInfoCell }
            empInfoCell.configureData(indexPath: indexPath, info: empInfo)
            return empInfoCell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constrants.CellIdentifier.CareerHistoryCell) as? CareerHistoryCell
            guard let careerHistoryCell = cell else { return UITableViewCell() }
            guard let careerInfo = empModel?.careerHistory else { return careerHistoryCell }
            careerHistoryCell.configureData(careerInfo: careerInfo[indexPath.row])
            return careerHistoryCell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constrants.CellIdentifier.EducationInfoCell) as? EducationInfoCell
            guard let educationInfoCell = cell else { return UITableViewCell() }
            guard let educationInfo = empModel?.education else { return educationInfoCell }
            educationInfoCell.configureData(educationInfo: educationInfo[indexPath.row])
            return educationInfoCell
        }
    }
}
