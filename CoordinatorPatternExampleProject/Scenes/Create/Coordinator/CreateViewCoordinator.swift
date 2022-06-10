//
//  CreateViewCoordinator.swift
//  CoordinatorPatternExampleProject
//
//  Created by Batuhan Baran on 10.06.2022.
//

import UIKit

final class CreateViewCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let createViewController = CreateViewController()
        createViewController.coordinator = self
        navigationController.pushViewController(createViewController, animated: true)
    }
}
