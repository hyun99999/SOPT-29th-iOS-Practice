//
//  FirstViewController.swift
//  29th-iOS-SeminarPractice-week1
//
//  Created by kimhyungyu on 2021/10/02.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchUpSendData(_ sender: Any) {
        guard let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: ResultViewController.identifier) as? ResultViewController else {
            return
        }
        
        resultViewController.message = messageTextField.text
        resultViewController.modalPresentationStyle = .overFullScreen
        self.present(resultViewController, animated: true, completion: nil)
    }
    
}
