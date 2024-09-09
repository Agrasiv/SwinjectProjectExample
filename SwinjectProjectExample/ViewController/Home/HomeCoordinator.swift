//
//  HomeCoordinator.swift
//  SwinjectProjectExample
//
//  Created by Pyae Phyo Oo on 9/9/2567 BE.
//

import Foundation
import Swinject

class HomeCoordinator {
    
    let container: Container
    let navigationController: UINavigationController
    
    init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: false)
    }
}
