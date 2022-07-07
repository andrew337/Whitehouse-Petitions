//
//  ViewController.swift
//  Whitehouse Petitions
//
//  Created by Admin on 7/4/22.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configure()
    }
    
    private func configure() {
       
        
        viewControllers = [createpetNC(), createpopNC()]
    }


    
    func createpetNC() -> UINavigationController {
        let vc = PetitionViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)
        return UINavigationController(rootViewController: vc)
    }
    
    func createpopNC() -> UINavigationController {
        let vc = PopularViewController()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        return UINavigationController(rootViewController: vc)
    }
}

