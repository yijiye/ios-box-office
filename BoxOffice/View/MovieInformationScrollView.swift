//
//  MovieInformationScrollView.swift
//  BoxOffice
//
//  Created by 리지, kokkilE on 2023/03/29.
//

import UIKit

final class MovieInformationScrollView: UIScrollView {
    private let movieInformationContentView = UIView()
    private let movieInformationStackView = UIStackView()
    private let moviePosterImageView = UIImageView()
    
    private let directorStackView = UIStackView()
    private let productionYearStackView = UIStackView()
    private let openDateStackView = UIStackView()
    private let showTimeStackView = UIStackView()
    private let watchGradeStackView = UIStackView()
    private let nationStackView = UIStackView()
    private let genresStackView = UIStackView()
    private let actorsStackView = UIStackView()
    
    func configure(by movie: MovieInformationItem) {
        self.addSubview(movieInformationContentView)
        
        configureContentView()
        configureStackView()
        configureImageView()
        configureDirectorStackView(by: movie)
        configureProductionYearStackView(by: movie)
        configureOpenDateStackView(by: movie)
        configureShowTimeStackView(by: movie)
        configureWatchGradeStackView(by: movie)
        configureNationStackView(by: movie)
        configureGenreStackView(by: movie)
        configureActorStackView(by: movie)
    }
    
    func setupMoviePoterImage(_ image: UIImage) {
        self.moviePosterImageView.image = image
    }

    private func configureContentView() {
        movieInformationContentView.addSubview(moviePosterImageView)
        movieInformationContentView.addSubview(movieInformationStackView)
        
        movieInformationContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieInformationContentView.topAnchor.constraint(equalTo: self.topAnchor),
            movieInformationContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieInformationContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            movieInformationContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            movieInformationContentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1)
        ])
    }
    
    private func configureStackView() {
        movieInformationStackView.spacing = 10
        movieInformationStackView.axis = .vertical
        
        movieInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieInformationStackView.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 10),
            movieInformationStackView.leadingAnchor.constraint(equalTo: movieInformationContentView.leadingAnchor),
            movieInformationStackView.bottomAnchor.constraint(equalTo: movieInformationContentView.bottomAnchor),
            movieInformationStackView.trailingAnchor.constraint(equalTo: movieInformationContentView.trailingAnchor)
        ])
    }
    
    private func configureImageView() {
        moviePosterImageView.contentMode = .scaleAspectFit
        moviePosterImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: movieInformationContentView.topAnchor),
            moviePosterImageView.leadingAnchor.constraint(equalTo: movieInformationContentView.leadingAnchor),
            moviePosterImageView.trailingAnchor.constraint(equalTo: movieInformationContentView.trailingAnchor),
            moviePosterImageView.heightAnchor.constraint(lessThanOrEqualTo: self.frameLayoutGuide.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureDirectorStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(directorStackView)
        directorStackView.distribution = .fill
        directorStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "감독"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        directorStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.directors
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        directorStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configureProductionYearStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(productionYearStackView)
        productionYearStackView.distribution = .fill
        productionYearStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "제작년도"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        productionYearStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.productionYear
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        productionYearStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configureOpenDateStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(openDateStackView)
        openDateStackView.distribution = .fill
        openDateStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "개봉일"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        openDateStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.openDate
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        openDateStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configureShowTimeStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(showTimeStackView)
        showTimeStackView.distribution = .fill
        showTimeStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "상영시간"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        showTimeStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.showTime
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        showTimeStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configureWatchGradeStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(watchGradeStackView)
        watchGradeStackView.distribution = .fill
        watchGradeStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "관람등급"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        watchGradeStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.audits
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        watchGradeStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configureNationStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(nationStackView)
        nationStackView.distribution = .fill
        nationStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "제작국가"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        nationStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.nations
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        nationStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configureGenreStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(genresStackView)
        genresStackView.distribution = .fill
        genresStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "장르"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        genresStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.genres
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        genresStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func configureActorStackView(by movie: MovieInformationItem) {
        movieInformationStackView.addArrangedSubview(actorsStackView)
        actorsStackView.distribution = .fill
        actorsStackView.spacing = 10
        
        let titleLabel = UILabel()
        titleLabel.text = "배우"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        actorsStackView.addArrangedSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(greaterThanOrEqualTo: directorStackView.widthAnchor, multiplier: 0.2)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = movie.actors
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontForContentSizeCategory = true
        
        actorsStackView.addArrangedSubview(descriptionLabel)
    }
}
