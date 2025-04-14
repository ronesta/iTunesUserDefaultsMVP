//
//  AlbumViewController.swift
//  iTunesUserDefaultsMVP
//
//  Created by Ибрагим Габибли on 10.01.2025.
//

import Foundation
import UIKit
import SnapKit

final class AlbumViewController: UIViewController {
    let albumImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.accessibilityIdentifier = "albumImageView"
        return image
    }()

    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.accessibilityIdentifier = "albumNameLabel"
        return label
    }()

    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        label.accessibilityIdentifier = "artistNameLabel"
        return label
    }()

    let collectionPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemOrange
        label.accessibilityIdentifier = "collectionPriceLabel"
        return label
    }()

    private let presenter: AlbumPresenterProtocol

    init(presenter: AlbumPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.viewDidLoad()
    }

    private func setupViews() {
        view.addSubview(albumImageView)
        view.addSubview(albumNameLabel)
        view.addSubview(artistNameLabel)
        view.addSubview(collectionPriceLabel)
        view.backgroundColor = .white

        albumImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }

        albumNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(albumImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        artistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }

        collectionPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(artistNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: - AlbumViewProtocol
extension AlbumViewController: AlbumViewProtocol {
    func displayAlbumDetails(album: Album, image: UIImage) {
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        collectionPriceLabel.text = "\(album.collectionPrice) $"
        albumImageView.image = image
    }
}
