//
//  DetailViewCoordinator.swift
//  CoordinatorPatternExampleProject
//
//  Created by Batuhan Baran on 10.06.2022.
//

import UIKit

final class DetailViewCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController = DetailViewController()
        detailViewController.coordinator = self
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
