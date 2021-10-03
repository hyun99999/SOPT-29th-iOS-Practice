//
//  ResultViewController.swift
//  29th-iOS-SeminarPractice-week1
//
//  Created by kimhyungyu on 2021/10/02.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - Properties
    
    var message: String?
    static let identifier = "ResultViewController"
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageLabel()
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func dismissToFirstViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Methods
    private func setMessageLabel() {
        if let message = message {
            messageLabel.text = message
        }
    }
}
