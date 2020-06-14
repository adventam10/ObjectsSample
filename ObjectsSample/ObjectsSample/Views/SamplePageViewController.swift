//
//  SamplePageViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

struct Page {
    let index: Int
    let color: UIColor
}

final class SamplePageViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    var page: Page?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let page = page {
            label.text = "Page: \(page.index)"
            view.backgroundColor = page.color
        }
    }
}
