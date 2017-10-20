//
//  CustomTabBarController.swift
//  TabBarTest
//
//  Created by Sjors van Berkel on 20-10-17.
//  Copyright © 2017 Sjors van Berkel. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selectedViewController?.tabBarItem.badgeValue="100"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.badgeValue = "100"
        tabBar.layoutIfNeeded()

        guard let customTabBar = tabBar as? CustomTabBar else {
            return
        }

        customTabBar.doMagic(item: item)
    }
}
