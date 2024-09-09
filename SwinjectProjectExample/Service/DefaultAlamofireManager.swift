//
//  DefaultAlamofireManager.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation
import Alamofire

class DefaultAlamofireManager: Alamofire.Session {
    
    static func getSession(timeout: Double) -> DefaultAlamofireManager {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = timeout
        configuration.timeoutIntervalForResource = timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireManager(configuration: configuration)
    }
    
    static var fetchTimeout: Double {
        40
    }
}
