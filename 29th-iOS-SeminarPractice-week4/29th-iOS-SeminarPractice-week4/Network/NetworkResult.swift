//
//  NetworkResult.swift
//  29th-iOS-SeminarPractice-week4
//
//  Created by kimhyungyu on 2021/11/06.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
