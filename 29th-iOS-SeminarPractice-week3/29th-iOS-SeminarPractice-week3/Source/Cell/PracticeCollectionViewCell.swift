//
//  PracticeCollectionViewCell.swift
//  29th-iOS-SeminarPractice-week3
//
//  Created by kimhyungyu on 2021/10/23.
//

import UIKit

class PracticeCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    
    static let identifier = "PracticeCollectionViewCell"
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var appIconName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Custom Methods
    
    func setData(appName: String, appImage: UIImage?) {
        appIconName.text = appName
        imageView.image = appImage
    }

}
