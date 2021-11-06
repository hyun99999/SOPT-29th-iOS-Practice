//
//  APIConstants.swift
//  29th-iOS-SeminarPractice-week4
//
//  Created by kimhyungyu on 2021/11/06.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/user/login"
    static let readUserURL = baseURL + "/user"
}
