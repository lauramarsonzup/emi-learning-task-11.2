//
//  ViewController.swift
//  LearningTask-11.2
//
//  Created by rafael.rollo on 03/11/2022.
//

import UIKit

class MoviesViewController: UITableViewController {
    
    var starshipsAPI: StarshipsAPI?
    
    var films = [Film]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        carregarFilmes()
    }
    
    private func carregarFilmes() {
        starshipsAPI?.getFilms(completionHandler: { films in
            self.films = films
        }, failureHandler: { error in
            print(error.errorDescription ?? "")
        })
    }

}

extension MoviesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? DefaultTableViewCell else {
            fatalError("Não foi possível recuperar Table View Cell")
        }
        
        cell.film = films[indexPath.row]
        return cell
    }
}

extension MoviesViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailsVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController else {
            fatalError("erro")
        }
        
        detailsVC.film = films[indexPath.row]
        detailsVC.starshipsAPI = starshipsAPI
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
