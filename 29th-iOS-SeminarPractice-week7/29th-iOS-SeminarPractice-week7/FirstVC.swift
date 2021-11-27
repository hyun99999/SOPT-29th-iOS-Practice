//
//  FirstVC.swift
//  29th-iOS-SeminarPractice-week7
//
//  Created by kimhyungyu on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {
    
    // MARK: - Identifier
    
    static let identifier = "FirstVC"
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        // codebase view transform.
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }

        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(notification:)), name: NSNotification.Name("iOS-Sample"), object: nil)
        
        // 1️⃣ present 로 데이터 전달
        secondVC.receivedText = textField.text ?? ""
        present(secondVC, animated: true, completion: nil)
         
        
        // 2️⃣ segue 를 사용한 데이터 전달
//        performSegue(withIdentifier: "presentSecondVC", sender: sender)
    }
    // 2️⃣ segue 를 사용한 데이터 전달
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentSecondVC" {
            let nextVC = segue.destination as? SecondVC
            nextVC?.receivedText = textField.text ?? ""
        }
    }
    */
    
    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            textField.text = text
        }
    }
}
