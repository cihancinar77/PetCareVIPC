//
//  ExploreView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

final class ExploreView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setup() {
        backgroundColor = Colors.pageGrey
		NSLayoutConstraint.activate([

		])
	}
}
