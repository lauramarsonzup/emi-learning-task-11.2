//
//  MovieDetailsViewController.swift
//  LearningTask-11.2
//
//  Created by Laura Pinheiro Marson on 05/12/22.
//

import UIKit

class MovieDetailsViewController: UITableViewController {
    
    var starshipsAPI: StarshipsAPI?
    
    var film: Film?
    
    var starships = [Starship]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        guard let film = film else { return }
        tableView.tableHeaderView = MovieDetailsHeaderView.constroi(para: film)
        
        carregaNaves(para: film)
    }
    
    private func carregaNaves(para film: Film) {
        starshipsAPI?.getAll(batching: film.starshipsURL, completionHandler: { starships, error in
            if let error = error {
                //
            } else {
                self.starships = starships
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard let headerView = tableView.tableHeaderView else {return}
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
            tableView.layoutIfNeeded()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starships.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipTableViewCell", for: indexPath) as? DefaultTableViewCell else {
            fatalError("erro")
        }
        
        cell.starship = starships[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

