//
//  TabBarViewController.swift
//  myApp
//
//  Created by Mert Karahan on 18.09.2022.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
//    Create and set tabbar controller.
    func setTabBar() {
        let firstItem = PostViewController()
        let secondItem = PhotosViewController()
        let thirdItem = ToDoListViewController()
        
        firstItem.title = "Post"
        firstItem.tabBarItem.image = UIImage(systemName: "signpost.right.fill")
        
        secondItem.title = "Photo"
        secondItem.tabBarItem.image = UIImage(systemName: "photo.circle")
        
        thirdItem.title = "To Do"
        thirdItem.tabBarItem.image = UIImage(systemName: "pencil")
        self.setViewControllers([firstItem, secondItem, thirdItem], animated: true)
    }
}
