//
//  TabbarPracticeViewController.swift
//  29th-iOS-SeminarPractice-week2
//
//  Created by kimhyungyu on 2021/10/09.
//

import UIKit

class TabbarPracticeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initTabbar()
    }
    
    func initTabbar () {
        guard let orangeVC = self.storyboard?.instantiateViewController(withIdentifier: "OrangeViewController"), let purpleVC = self.storyboard?.instantiateViewController(withIdentifier: "PurpleViewController") else { return }
        orangeVC.tabBarItem.title = "Orange"
        orangeVC.tabBarItem.image = UIImage(systemName: "circle")
        orangeVC.tabBarItem.selectedImage = UIImage(systemName: "circle.fill")
        
        purpleVC.tabBarItem.title = "Purple"
        purpleVC.tabBarItem.image = UIImage(systemName: "circle")
        purpleVC.tabBarItem.selectedImage = UIImage(systemName: "circle.fill")
        
        setViewControllers([orangeVC, purpleVC], animated: true)
    }
}
