//
//  Coordinator.swift
//  CoordinatorPatternExampleProject
//
//  Created by Batuhan Baran on 10.06.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get set }
    
    func start()
}
