//
//  MovieTableViewCell.swift
//  LearningTask-11.2
//
//  Created by Laura Pinheiro Marson on 02/12/22.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var subtituloLabel: UILabel!
    
    var film: Film? {
        didSet {
            guard let film = film else { return }
            tituloLabel.text = film.title
            subtituloLabel.text = "Episode \(film.episodeId)"
        }
    }
    
    var starship: Starship? {
        didSet {
            guard let starship = starship else { return }
            tituloLabel.text = starship.name
            subtituloLabel.text = starship.model
        }
    }
    
}
