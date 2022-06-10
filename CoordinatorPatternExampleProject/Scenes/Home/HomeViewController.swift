//
//  HomeViewController.swift
//  CoordinatorPatternExampleProject
//
//  Created by Batuhan Baran on 10.06.2022.
//

import UIKit

class HomeViewController: UIViewController {

    weak var parentCoordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func navigateToDetail(_ sender: Any) {
        parentCoordinator?.detailView()
    }
    
    @IBAction func navigateToCreate(_ sender: Any) {
        parentCoordinator?.createView()
    }
}
