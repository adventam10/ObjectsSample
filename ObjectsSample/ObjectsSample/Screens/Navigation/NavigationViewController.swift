//
//  NavigationViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class NavigationViewController: UIViewController {

    @IBOutlet private weak var navigationBar: UINavigationBar!
    @IBOutlet private weak var navigation1BarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var navigation2BarButtonItem: UIBarButtonItem!

    @IBOutlet private weak var toolBar: UIToolbar!
    @IBOutlet private weak var tool1BarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var fixedSpace: UIBarButtonItem!
    @IBOutlet private weak var tool2BarButtonItem: UIBarButtonItem!
    @IBOutlet private weak var flexibleSpace: UIBarButtonItem!
    @IBOutlet private weak var tool3BarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK:- IBAction
    @IBAction private func tappedNavigation1BarButtonItem(_ sender: Any) {
        print("tappedNavigation1BarButtonItem")
    }

    @IBAction private func tappedNavigation2BarButtonItem(_ sender: Any) {
        print("tappedNavigation2BarButtonItem")
    }
    
    @IBAction private func tappedTool1BarButtonItem(_ sender: Any) {
        print("tappedTool1BarButtonItem")
    }

    @IBAction private func tappedTool2BarButtonItem(_ sender: Any) {
        print("tappedTool2BarButtonItem")
    }

    @IBAction private func tappedTool3BarButtonItem(_ sender: Any) {
        print("tappedTool3BarButtonItem")
    }
}
