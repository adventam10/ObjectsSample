//
//  TableViewController.swift
//  ObjectsSample
//
//  Created by am10 on 2020/06/13.
//  Copyright © 2020 am10. All rights reserved.
//

import UIKit

enum Menu: CaseIterable {
    case widgets
    case pickers
    case scroll
    case web
    case containers
    case gestures
    case navigation
    case tab
    case map
    case collection
    case page
    case player

    var title: String {
        switch self {
        case .widgets:
            return "Widgets"
        case .pickers:
            return "Pickers"
        case .scroll:
            return "Scroll"
        case .web:
            return "Web"
        case .containers:
            return "Containers"
        case .gestures:
            return "Gestures"
        case .navigation:
            return "Navigation"
        case .tab:
            return "Tab"
        case .map:
            return "Map"
        case .collection:
            return "Collection"
        case .page:
            return "Page"
        case .player:
            return "Player"
        }
    }

    var segueId: String {
        switch self {
        case .widgets:
            return "toWidgets"
        case .pickers:
            return "toPickers"
        case .scroll:
            return "toScroll"
        case .web:
            return "toWeb"
        case .containers:
            return "toContainers"
        case .gestures:
            return "toGestures"
        case .navigation:
            return "toNavigation"
        case .tab:
            return "toTab"
        case .map:
            return "toMap"
        case .collection:
            return "toCollection"
        case .page:
            return "toPage"
        case .player:
            return "toPlayer"
        }
    }
}

final class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = Menu.allCases[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Menu.allCases[indexPath.row].segueId, sender: nil)
    }
}
