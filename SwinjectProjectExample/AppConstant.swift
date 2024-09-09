//
//  AppConstant.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation

public struct Environment {
    //MARK: - Keys
    enum Keys {
        enum Plist {
            static let environment = "ENV"
            static let rootURL = "API_SERVER_URL"
        }
    }
    
    //MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    //MARK: - Plist values
    static let rootURL: String = {
        guard let rootURLString = Environment.infoDictionary[Keys.Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        var prefix = "http://"
        if enviroment == "Production" {
            prefix = "https://"
        }
        return prefix + rootURLString
    }()
    
    static let enviroment: String = {
        guard let enviromentString = Environment.infoDictionary[Keys.Plist.environment] as? String else {
            fatalError("Envirment URL not set in plist for this environment")
        }
        return enviromentString
    }()
}
