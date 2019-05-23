//
//  EmployeeInfoCell.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import UIKit

class EmployeeInfoCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // Method to setup data into the cell fields.
    func configureData(indexPath: IndexPath, info: EmployeeCVModel) {
        switch indexPath.section {
        case 0:
            setupData(title: Constrants.Name, value: info.employeeName ?? "")
        case 1:
            setupData(title: Constrants.Position, value: info.position ?? "")
        case 2:
            setupData(title: Constrants.About, value: info.careerSummary ?? "")
        case 3:
            setupData(title: "\(String(indexPath.row + 1)).)", value: info.skills?[indexPath.row] ?? "")
        case 4:
            setupData(title: "\(String(indexPath.row + 1)).)", value: info.languages?[indexPath.row] ?? "")
        default:
            return
        }
    }
    
    fileprivate func setupData(title: String, value: String) {
        lblTitle.text = title
        lblValue.text = value
    }
}
