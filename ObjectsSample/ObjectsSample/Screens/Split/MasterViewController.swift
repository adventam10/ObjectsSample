//
//  MasterViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/14.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

final class MasterViewController: UITableViewController {

    private let colors: [UIColor] = [
        .systemRed, .systemBlue, .systemPink,
        .systemTeal, .systemGreen, .systemIndigo,
        .systemOrange, .systemYellow, .systemPurple
    ]
    private let tableDataList = [
        "Red", "Blue", "Pink",
        "Teal", "Green", "Indigo",
        "Orange", "Yellow", "Purple"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? DetailViewController,
            let param = sender as? (color: UIColor, text: String) {
            detail.text = param.text
            detail.color = param.color
        }
    }

    @IBAction private func close(_ sender: Any) {
        dismiss(animated: true)
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tableDataList[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: (color: colors[indexPath.row], text: tableDataList[indexPath.row]))
    }
}
