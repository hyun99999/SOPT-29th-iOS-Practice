//
//  GestureVC.swift
//  29th-iOS-SeminarPractice-week7
//
//  Created by kimhyungyu on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {

    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var testView: UIView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapView(gestureRecognizer:)))
        testView.addGestureRecognizer(tapRecognizer)
    }
    // 인터페이스 빌더를 통한 제스쳐 등록
//    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
//        print("UIView 안에서 tap")
//    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        print("UIView 안에서 tap")
    }
}
