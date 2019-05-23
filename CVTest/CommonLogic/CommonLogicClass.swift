//
//  CommonLogicClass.swift
//  CVTest
//
//  Created by amandeep.singh Singh on 5/21/19.
//  Copyright © 2019 Amandeep Singh. All rights reserved.
//

import UIKit

class CommonLogicClass: NSObject {

    // Method to show title on empty table view.
    static func showEmptyTableViewLabel(size: CGSize, title: String) -> UIView {
        let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        emptyLabel.text = title
        emptyLabel.textAlignment = .center
        emptyLabel.numberOfLines = 0
        emptyLabel.lineBreakMode = .byWordWrapping
        return emptyLabel
    }

    // Method to download image from the URL.
    static func getCompanyLogo(companyName: String, completion: @escaping (_ image: UIImage?) -> Void) {
        let url = URL(string: companyName)
        if let iconURL = url {
            // Download image in background thread.
            DispatchQueue.global().async {
                guard let imageData = try? Data(contentsOf: iconURL) else { return }
                let image = UIImage(data: imageData)
                if let newImage = image {
                    completion(newImage)
                }
            }
        }
    }
}
