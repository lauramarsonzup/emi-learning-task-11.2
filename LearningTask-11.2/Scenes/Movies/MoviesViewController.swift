//
//  ViewController.swift
//  LearningTask-11.2
//
//  Created by rafael.rollo on 03/11/2022.
//

import UIKit

class MoviesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MoviesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? DefaultTableViewCell else {
            fatalError("Não foi possível recuperar Table View Cell")
        }
        cell.backgroundColor = .red
        return cell
    }
}
