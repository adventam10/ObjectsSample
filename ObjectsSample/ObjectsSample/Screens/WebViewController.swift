//
//  WebViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {

    @IBOutlet weak private var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.am10.blog/?p=89")!
        let request = URLRequest(url: url)
        webView.load(request)
    }

}
