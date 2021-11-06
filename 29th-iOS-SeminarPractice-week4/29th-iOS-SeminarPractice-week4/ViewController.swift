//
//  ViewController.swift
//  29th-iOS-SeminarPractice-week4
//
//  Created by kimhyungyu on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - @IBOutlet Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTestLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - @IBAction Properties
    @IBAction func touchToUpLogin(_ sender: Any) {
        requestLogin()
    }
    
   func simpleAlert(title: String, message: String) {
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       let okAction = UIAlertAction(title: "확인", style: .default)
       alert.addAction(okAction)
       present(alert, animated: true)
    }
    
}

// MARK: - Network

extension ViewController {
    func requestLogin() {
        UserSignService.shared.login(email: emailTextField.text ?? "",
                                     password: passwordTextField.text ?? "") { response in
            switch response {
            case .success(let loginResponse):
                if let userData = loginResponse as? LoginResultData {
                    self.simpleAlert(title: "로그인", message: "\(userData.name)님 환영합니다!")
                    self.getUserData(userID: userData.id)
                    self.getUserDataUsingQuery(email: userData.email)
                }
            case .requestErr(let msg):
                print("requestErr: \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
    
    func getUserData(userID: Int) {
        UserSignService.shared.readUserData(userID: userID) { responseData in
            switch responseData {
            case .success(let userDataResponse):
                if let userData = userDataResponse as? LoginResultData {
                    self.userTestLabel.text = userData.name
                }
            case .requestErr(let msg):
                print("requestErr: \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        }
    }
    
    func getUserDataUsingQuery(email: String) {
        UserSignService.shared.readUserDataUsingQuerey(email: email) { responseData in
            switch responseData {
            case .success(let userDataResponse):
                if let userData = userDataResponse as? LoginResultData {
                    self.userEmailLabel.text = userData.email
                }
            case .requestErr(let msg):
                print("requestErr: \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
