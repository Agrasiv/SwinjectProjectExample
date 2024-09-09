//
//  AppDIContainer.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation
import Swinject

class AppDIContainer {
    
    static let shared = AppDIContainer()
    let container: Container
    
    init() {
        self.container = Container()
        
        //Coordinator
        container.register(AppCoordinator.self) { r in
            AppCoordinator(container: r as! Container)
        }
        
        container.register(HomeCoordinator.self) { r, navigationController in
            HomeCoordinator(container: r as! Container, navigationController: navigationController)
        }
    }
}
