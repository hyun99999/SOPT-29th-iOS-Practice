//
//  KeywordCVC.swift
//  29th-iOS-SeminarPractice-week7
//
//  Created by kimhyungyu on 2021/11/27.
//

import UIKit

// MARK: - KeywordCellDelegate

protocol KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnselected(cell: KeywordCVC, unseletedName: String)
}

class KeywordCVC: UICollectionViewCell {

    // MARK: - Identifier
    
    static let identifier = "KeywordCVC"
    
    // MARK: - Properties
    
    var keyword: String = ""
    var selectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?
    var presentingClosure: (() -> ())?
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var keywordButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func touchUpToSendData(_ sender: Any) {
        if selectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self, unseletedName: keyword)
            
            keywordButton.backgroundColor = .clear
        } else {
            keywordDelegate?.keywordCellSelected(cell: self)
            presentingClosure?()
            
            keywordButton.backgroundColor = .yellow
        }
        selectedKeyword.toggle()
    }
    func setKeyword(text: String) {
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }
    
}
