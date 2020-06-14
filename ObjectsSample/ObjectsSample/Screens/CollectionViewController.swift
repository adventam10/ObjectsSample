//
//  CollectionViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class CollectionViewController: UICollectionViewController {

    private let colors: [UIColor] = [
        .systemRed, .systemBlue, .systemPink,
        .systemTeal, .systemGreen, .systemIndigo,
        .systemOrange, .systemYellow, .systemPurple
    ]

    private var collectionDataList: [UIColor] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1...100 {
            collectionDataList.append(colors.shuffled()[0])
        }
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionDataList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = collectionDataList[indexPath.row]
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace: CGFloat = 16
        let columnCount: CGFloat = 8
        let cellSize: CGFloat = (view.bounds.width - horizontalSpace * (columnCount + 1)) / columnCount
        return CGSize(width: cellSize, height: cellSize)
    }
}
