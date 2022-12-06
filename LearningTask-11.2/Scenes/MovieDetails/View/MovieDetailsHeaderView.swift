//
//  MovieDetailsHeaderView.swift
//  LearningTask-11.2
//
//  Created by Laura Pinheiro Marson on 05/12/22.
//

import UIKit

class MovieDetailsHeaderView: UIView {
    
    static func constroi(para filme: Film) -> MovieDetailsHeaderView {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        return MovieDetailsHeaderView(com: frame, e: filme)
    }

    private lazy var tituloFilmeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 28)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = film.title
        return label
    }()
    
    private lazy var capituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Episode \(film.episodeId)"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var tituloStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            tituloFilmeLabel,
            capituloLabel
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 2
        return stackview
    }()
    
    private lazy var diretorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "DIRECTOR"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var nomeDiretorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = film.director
        return label
    }()
    
    private lazy var diretorStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            diretorLabel,
            nomeDiretorLabel
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 2
        return stackview
    }()
    
    private lazy var produtorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "PRODUCER"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var nomeProdutorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = film.producer
        return label
    }()
    
    private lazy var produtorStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            produtorLabel,
            nomeProdutorLabel
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 2
        return stackview
    }()
    
    private lazy var lancamentoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "RELEASE DATE"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = DateFormatter.format(date: film.releaseDate, to: .dayMonthAndYear)
        return label
    }()
    
    private lazy var dataLancamentoStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            lancamentoLabel,
            dataLabel
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 2
        return stackview
    }()
    
    private lazy var starshipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "STARSHIPS"
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var containerView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
            tituloStackView,
            diretorStackView,
            produtorStackView,
            dataLancamentoStackView,
            starshipLabel
        ])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillProportionally
        stackview.spacing = 16
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        return stackview
    }()
    
    var film: Film
    
    private init(com frame: CGRect, e filme: Film) {
        film = filme
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addViews()
        addConstraints()
    }

    private func addViews() {
        addSubview(containerView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
