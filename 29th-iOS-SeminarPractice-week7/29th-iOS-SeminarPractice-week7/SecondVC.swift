//
//  SecondVC.swift
//  29th-iOS-SeminarPractice-week7
//
//  Created by kimhyungyu on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {

    // MARK: - Identifier
    
    static let identifier = "SecondVC"
    
    // MARK: - Properties
    
    var receivedText: String = ""
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = receivedText
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func touchUpToSendData(_ sender: Any) {

        // 4️⃣ Notification Center
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"), object: textField.text ?? "")
        
        // 3️⃣ presentingViewController 를 사용해서 데이터 전달
//        let presentingVC = presentingViewController as? FirstVC
//        presentingVC?.textField.text = textField.text ?? ""
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Methods
    
    // viewDidLoad 보다 먼저 호출되서 textField 변수가 비어있기 때문에 런타임 에러가 등장한다.
//    func setDataInTextField(data: String) {
//        textField.text = data
//    }
}
