//
//  EducationInfoCell.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import UIKit

class EducationInfoCell: UITableViewCell {
    
    @IBOutlet weak var lblCourse: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblCollege: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureData(educationInfo: EducationModel) {
        lblCourse.text = educationInfo.course
        lblDuration.text = educationInfo.duration
        lblCollege.text = educationInfo.college
    }
}
