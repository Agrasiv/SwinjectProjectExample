//
//  HomeViewModel.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation

class HomeViewModel {
    
    private let userWebService: UserWebServiceProtocol
    private var users: [UserResponse] = []
    
    var usersChanged: (([UserResponse]) -> Void)?
    
    init(userWebService: UserWebServiceProtocol) {
        self.userWebService = userWebService
    }
    
    func fetchUsers() {
        userWebService.getUsers(parameters: [:]) { [weak self] result in
            switch result {
            case .success(let response):
                self?.users = response
                self?.usersChanged?(self?.users ?? [])
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
