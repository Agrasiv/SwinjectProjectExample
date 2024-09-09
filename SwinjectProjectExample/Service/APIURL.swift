//
//  APIURL.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation
import Moya

enum APIURL {
    case getUsers(parameters: [String: Any])
}

extension APIURL: TargetType {
    
    var baseURL: URL {
        return URL(string: Environment.rootURL)!
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUsers(let parameter):
            return .requestParameters(parameters: parameter, encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
}

