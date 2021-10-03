//
//  ViewController.swift
//  29th-iOS-SeminarPractice-week1
//
//  Created by kimhyungyu on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var testLabel: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchUpToChangeLabel(_ sender: Any) {
        testLabel.text = "WE SPOT 1차 세미나"
        testLabel.sizeToFit()
    }
    @IBAction func modalPresentToSecondViewController(_ sender: Any) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: SecondViewController.identifier) as? SecondViewController else {
            return
        }
        
        // present modally
//        secondViewController.modalPresentationStyle = .overFullScreen
//        secondViewController.modalTransitionStyle = .crossDissolve
//        self.present(secondViewController, animated: true) {
//            print("present")
//        }
        
        // navigation push
        self.navigationController?.pushViewController(secondViewController, animated: true)

    }
}

