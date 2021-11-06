//
//  LoginResponseDataModel.swift
//  29th-iOS-SeminarPractice-week4
//
//  Created by kimhyungyu on 2021/11/06.
//

import Foundation

struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
