//
//  TabItem2ViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class TabItem2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func tappedButton(_ sender: Any) {
        guard let tabBarController = parent as? UITabBarController else {
            return
        }
        tabBarController.selectedViewController = tabBarController.viewControllers?[0]
    }
}
