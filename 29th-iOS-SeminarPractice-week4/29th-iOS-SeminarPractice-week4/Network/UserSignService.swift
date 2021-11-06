//
//  UserSignService.swift
//  29th-iOS-SeminarPractice-week4
//
//  Created by kimhyungyu on 2021/11/06.
//

import Foundation
import Alamofire

struct UserSignService {
    static let shared = UserSignService()
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.loginURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let data = dataResponse.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    func readUserData(userID: Int,
                      completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.readUserURL + "/\(userID)"
        
        let dataRequest = AF.request(url, method: .get)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let data = dataResponse.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
        
    }
    
    func readUserDataUsingQuerey(email: String,
                                 completion: @escaping (NetworkResult<Any>) -> (Void)) {
        let url = APIConstants.readUserURL
        
        let query: Parameters = ["email" : email]
        
        let dataRequest = AF.request(url, method: .get, parameters: query, encoding: URLEncoding.default)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let data = dataResponse.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
        
    }
    
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidLoginData(data: data, valid: true)
        case 400..<500: return isValidLoginData(data: data, valid: false)
        case 500: return .serverErr
        default : return .networkFail
        }
    }
    
    private func isValidLoginData(data: Data, valid: Bool) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(LoginResponseData.self, from: data) else { return .pathErr}
        if valid {
            return .success(decodedData.data)
        } else {
            return .requestErr(decodedData.message)
        }
    }
}
