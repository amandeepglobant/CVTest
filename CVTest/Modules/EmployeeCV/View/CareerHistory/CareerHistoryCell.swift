//
//  CareerHistoryCell.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import UIKit

class CareerHistoryCell: UITableViewCell {
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var lblResponsibilities: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageViewLogo.layer.cornerRadius = 5.0
        imageViewLogo.layer.masksToBounds = true
        imageViewLogo.layer.borderWidth = 1.0
        imageViewLogo.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureData(careerInfo: CareerHistoryModel) {
        CommonLogicClass.getCompanyLogo(companyName: careerInfo.companylogo ) { [weak self] (image) in
            DispatchQueue.main.async(execute: {
                self?.imageViewLogo.image = image
            })
        }
        lblCompany.text = careerInfo.company
        lblDuration.text = careerInfo.duration
        lblRole.text = careerInfo.role
        lblResponsibilities.text = careerInfo.responsibilities
    }
}
