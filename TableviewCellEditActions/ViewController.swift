//
//  ViewController.swift
//  TableviewCellEditActions
//
//  Created by ProgrammingWithSwift on 2020/05/03.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data = Array(0..<10)

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(self.data[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    private func handleMarkAsFavourite() {
        print("Marked as favourite")
    }

    private func handleMarkAsUnread() {
        print("Marked as unread")
    }

    private func handleMoveToTrash() {
        print("Moved to trash")
    }

    private func handleMoveToArchive() {
        print("Moved to archive")
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Favourite") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsFavourite()
                                            completionHandler(true)
        }
        action.backgroundColor = .systemBlue

        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        // Archive action
        let archive = UIContextualAction(style: .normal,
                                         title: "Archive") { [weak self] (action, view, completionHandler) in
                                            self?.handleMoveToArchive()
                                            completionHandler(true)
        }
        archive.backgroundColor = .systemGreen

        // Trash action
        let trash = UIContextualAction(style: .destructive,
                                       title: "Trash") { [weak self] (action, view, completionHandler) in
                                        self?.handleMoveToTrash()
                                        completionHandler(true)
        }
        trash.backgroundColor = .systemRed

        // Unread action
        let unread = UIContextualAction(style: .normal,
                                       title: "Mark as Unread") { [weak self] (action, view, completionHandler) in
                                        self?.handleMarkAsUnread()
                                        completionHandler(true)
        }
        unread.backgroundColor = .systemOrange

        let configuration = UISwipeActionsConfiguration(actions: [archive, trash, unread])
//        configuration.performsFirstActionWithFullSwipe = false

        return configuration
    }
    
    /*
     iOS 12 and below, use this to remove the delete
     trailing swipe action that is on by default
     */
//    func tableView(_ tableView: UITableView,
//                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
}
