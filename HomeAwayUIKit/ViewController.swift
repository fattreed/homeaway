//
//  ViewController.swift
//  HomeAwayUIKit
//
//  Created by matty on 3/7/20.
//  Copyright © 2020 matty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    var lastTimeCalled: DispatchTime = DispatchTime.now()
    var delay = DispatchTimeInterval.milliseconds(300)
    
    let searchController = UISearchController()
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    private func search(with query: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            guard self.lastTimeCalled + self.delay < .now() else {
                return
            }
            
            self.lastTimeCalled = .now()
            print("called")
            API.search(with: query) { events in
                self.events = events
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! EventViewController
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        vc.event = events[indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        
        let event = events[indexPath.row]
        cell.configure(with: event)
        
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            search(with: searchText)
        }
    }
}
