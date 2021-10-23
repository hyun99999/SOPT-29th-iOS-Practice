//
//  AppContentDataModel.swift
//  29th-iOS-SeminarPractice-week3
//
//  Created by kimhyungyu on 2021/10/23.
//

import Foundation
import UIKit
struct AppContentData {
    let appName: String
    let description: String
    let appIconName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}

