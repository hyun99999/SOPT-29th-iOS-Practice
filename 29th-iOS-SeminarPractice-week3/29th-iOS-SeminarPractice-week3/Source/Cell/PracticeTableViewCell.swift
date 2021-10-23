//
//  PracticeTableViewCell.swift
//  29th-iOS-SeminarPractice-week3
//
//  Created by kimhyungyu on 2021/10/23.
//

import UIKit

class PracticeTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static let identifier = "PracticeTableViewCell"
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appIconImageView: UIImageView!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

   // MARK: - Custom Methods

    func setData(rank: Int, appData: AppContentData) {
        rankLabel.text = "\(rank)"
        titleLabel.text = appData.appName
        subTitleLabel.text = appData.description
        appIconImageView.image = appData.makeImage()
    }
}
