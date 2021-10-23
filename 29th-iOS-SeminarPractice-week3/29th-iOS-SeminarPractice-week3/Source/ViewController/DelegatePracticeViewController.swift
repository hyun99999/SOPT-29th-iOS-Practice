//
//  DelegatePracticeViewController.swift
//  29th-iOS-SeminarPractice-week3
//
//  Created by kimhyungyu on 2021/10/23.
//

import UIKit

class DelegatePracticeViewController: UIViewController {
    
// MARK: - @IBOutlet Properties
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignDelegate()

    }

}

// MARK: - Extensions

extension DelegatePracticeViewController {
    private func assignDelegate() {
        textField.delegate = self
    }
}

// MARK: - UITextFieldDelegate

extension DelegatePracticeViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("UITextFieldDelegate: textFieldDidEndEditing()")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("UITextFieldDelegate: textFieldDidBeginEditing()")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("UITextFieldDelegate: textFieldShouldReturn()")
        textField.endEditing(true)
        return true
    }
}
