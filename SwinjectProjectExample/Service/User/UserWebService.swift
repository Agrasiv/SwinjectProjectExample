//
//  UserWebService.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation

protocol UserWebServiceProtocol {
    func getUsers(parameters: [String: Any], completion: @escaping (Result<[UserResponse], Error>) -> Void)
    
}

class UserWebService: UserWebServiceProtocol {
    let webService = WebService<APIURL>()
    
    func getUsers(parameters: [String : Any], completion: @escaping (Result<[UserResponse], any Error>) -> Void) {
        webService.requestObject(path: .getUsers(parameters: parameters)) { (result: Result<[UserResponse], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
