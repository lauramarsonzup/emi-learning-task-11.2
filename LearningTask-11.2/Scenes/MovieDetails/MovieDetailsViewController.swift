//
//  MovieDetailsViewController.swift
//  LearningTask-11.2
//
//  Created by Laura Pinheiro Marson on 05/12/22.
//

import UIKit

class MovieDetailsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        
        return cell
    }
}
