//
//  PageViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class PageViewController: UIPageViewController {

    private var currentPageIndex = 0
    private var pages = [Page]()
    private let colors: [UIColor] = [
        .systemRed, .systemBlue, .systemPink,
        .systemTeal, .systemGreen, .systemIndigo,
        .systemOrange, .systemYellow, .systemPurple
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0...16 {
            pages.append(.init(index: i, color: colors.shuffled()[0]))
        }
        setViewControllers([makeSamplePage(page: pages[currentPageIndex])], direction: .forward, animated: false)
        dataSource = self
    }

    private func makeSamplePage(page: Page) -> SamplePageViewController {
        let viewController = SamplePageViewController()
        viewController.page = page
        return viewController
    }
}

extension PageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if currentPageIndex == 0 {
            return nil
        }
        currentPageIndex -= 1
        return makeSamplePage(page: pages[currentPageIndex])
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if currentPageIndex >= pages.count - 1 {
            return nil
        }
        currentPageIndex += 1
        return makeSamplePage(page: pages[currentPageIndex])
    }
}
