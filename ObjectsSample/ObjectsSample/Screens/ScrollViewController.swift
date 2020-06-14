//
//  ScrollViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class ScrollViewController: UIViewController {

    @IBOutlet private weak var pageControl: UIPageControl! {
        didSet {
            // コードで設定する場合
//            pageControl.currentPage = 0
//            pageControl.numberOfPages = 9
//            pageControl.currentPageIndicatorTintColor = .systemOrange
//            pageControl.pageIndicatorTintColor = .systemBlue
        }
    }
    @IBOutlet private weak var scrollView: UIScrollView! {
        didSet {
            // コードで設定する場合
//            scrollView.isScrollEnabled = true
//            scrollView.isPagingEnabled = true
//            scrollView.showsHorizontalScrollIndicator = true
//            scrollView.showsVerticalScrollIndicator = false
//            scrollView.indicatorStyle = .default
            scrollView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func pageControlValueChanged(_ sender: Any) {
        print("PageControl Change! currentPage: \(pageControl.currentPage)")
        scrollPage(at: pageControl.currentPage)
    }

    private func scrollPage(at index: Int) {
        let x = scrollView.frame.size.width * CGFloat(index)
        scrollView.setContentOffset(.init(x: x, y: 0), animated: true)
    }
}

extension ScrollViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
