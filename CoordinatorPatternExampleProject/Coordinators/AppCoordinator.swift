//
//  AppCoordinator.swift
//  CoordinatorPatternExampleProject
//
//  Created by Batuhan Baran on 10.06.2022.
//

import UIKit

final class AppCoordinator: NSObject, Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        homeViewController.parentCoordinator = self
        navigationController.setViewControllers([homeViewController], animated: false)
        navigationController.delegate = self
    }
    
    private func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func detailView() {
        let child = DetailViewCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func createView() {
        let child = CreateViewCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromViewController)  { return }
        
        switch fromViewController {
        case (let createViewController as CreateViewController):
            childDidFinish(createViewController.coordinator)
        case (let detailViewContrller as DetailViewController):
            childDidFinish(detailViewContrller.coordinator)
        default:
            break
        }
    }
}
