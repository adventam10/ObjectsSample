//
//  ContainersViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class SampleCollectionHeader: UICollectionReusableView {
    @IBOutlet weak var label: UILabel!
}

final class Sample1TableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var subLabel: UILabel!
}

final class Sample1CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

final class ContainersViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "Sample2TableViewCell", bundle: nil), forCellReuseIdentifier: "Sample2")
        }
    }
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "Sample2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Sample2")
        }
    }

    enum TableData {
        case `default`
        case sample1(text: String)
        case sample2
    }

    enum CollectionData {
        case sample1(Sample)
        case sample2(Sample)
        enum Sample {
            case red
            case blue
            case green
            case orange
            case black
            case pink
            case purple
            case yellow

            var image: UIImage {
                switch self {
                case .red:
                    return UIImage(named: "botman_red")!
                case .blue:
                    return UIImage(named: "botman_blue")!
                case .green:
                    return UIImage(named: "botman_green")!
                case .orange:
                    return UIImage(named: "botman_orange")!
                case .black:
                    return UIImage(named: "botman_black")!
                case .pink:
                    return UIImage(named: "botman_pink")!
                case .purple:
                    return UIImage(named: "botman_purple")!
                case .yellow:
                    return UIImage(named: "botman_yellow")!
                }
            }

            var title: String {
                switch self {
                case .red:
                    return "Red"
                case .blue:
                    return "Blue"
                case .green:
                    return "Green"
                case .orange:
                    return "Orange"
                case .black:
                    return "Black"
                case .pink:
                    return "Pink"
                case .purple:
                    return "Purple"
                case .yellow:
                    return "Yellow"
                }
            }
        }
    }

    private let tableDataList: [TableData] = [
        .default, .default, .sample1(text: "SubText"),
        .sample2, .sample2, .sample1(text: "SubText"),
        .sample2, .default, .sample1(text: "SubText")
    ]

    private let collectionDataList: [CollectionData] = [
        .sample1(.red), .sample2(.blue), .sample2(.green), .sample2(.yellow),
        .sample1(.pink), .sample1(.black), .sample1(.purple), .sample1(.red),
        .sample2(.green), .sample1(.blue), .sample1(.yellow), .sample2(.black),
        .sample2(.pink), .sample2(.purple), .sample2(.blue), .sample2(.red),
    ]

    private var sampleContainerViewController: SampleContainerViewController {
        return children.first { $0 is SampleContainerViewController } as! SampleContainerViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SampleContainerViewController {
            // ここで初期化処理できる
            print(destination.hoge)
        }
    }

}

extension ContainersViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableDataList[indexPath.row] {
        case .default:
            var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            }
            cell?.textLabel?.text = "Default Row: \(indexPath.row)"
            return cell!
        case .sample1(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sample1", for: indexPath) as! Sample1TableViewCell
            cell.label.text = "Sample1 Row: \(indexPath.row)"
            cell.subLabel.text = text
            return cell
        case .sample2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Sample2", for: indexPath) as! Sample2TableViewCell
            cell.label.text = "Sample2 Row: \(indexPath.row)"
            return cell
        }
    }
}

extension ContainersViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tableViewDidSelectRowAt indexPath: \(indexPath)")
    }
}

extension ContainersViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionDataList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionDataList[indexPath.row] {
        case .sample1(let sample):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Sample1", for: indexPath) as! Sample1CollectionViewCell
            cell.imageView.image = sample.image
            return cell
        case .sample2(let sample):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Sample2", for: indexPath) as! Sample2CollectionViewCell
            cell.titleLabel.text = sample.title
            cell.imageView.image = sample.image
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! SampleCollectionHeader
        header.label.text = "セクション"
        return header
    }
}

extension ContainersViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionViewDidSelectRowAt indexPath: \(indexPath)")
    }
}
