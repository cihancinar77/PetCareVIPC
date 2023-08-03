//
//  SplashView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

final class SplashView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gradient_background")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pawImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage.gifImageWithName("pawGif")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setup() {
        addSubview(backgroundImageView)
        addSubview(pawImageView)
		NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pawImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            pawImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
}
