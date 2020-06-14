//
//  DetailViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {

    var color: UIColor?
    var text: String?

    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = text
        view.backgroundColor = color
    }
}
