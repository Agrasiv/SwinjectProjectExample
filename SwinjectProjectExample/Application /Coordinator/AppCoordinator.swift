//
//  AppCoordinator.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation
import Swinject

class AppCoordinator {
    
    let container: Container
    var navigationController: UINavigationController?
    
    init(container: Container) {
        self.container = container
    }
    
    func start(window: UIWindow) {
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let homeCoordinator = container.resolve(HomeCoordinator.self, argument: navigationController)
        homeCoordinator?.start()
    }
    
}
