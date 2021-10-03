//
//  SecondViewController.swift
//  29th-iOS-SeminarPractice-week1
//
//  Created by kimhyungyu on 2021/10/02.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Properties
    
    static let identifier = "SecondViewController"
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func dismissToMainViewController(_ sender: Any) {
        // dismiss
//        self.dismiss(animated: true) {
//            print("dismiss")
//        }
        
        // pop
        self.navigationController?.popViewController(animated: true)
    }
}
