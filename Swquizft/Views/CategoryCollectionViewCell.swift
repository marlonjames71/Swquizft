//
//  CategoryCollectionViewCell.swift
//  Swquizft
//
//  Created by Michael Redig on 7/29/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
	@IBOutlet var contentsContainer: UIView!
	@IBOutlet var titleLabel: UILabel!

	var category: Question.Category? {
		didSet {
			updateViews()
		}
	}
	var questionsController: QuestionController?

	override var isSelected: Bool {
		// this is a hack so that "didSelectItem" will *always* trigger upon touch
		get { return false }
		set {} // do nothing
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		contentsContainer.layer.borderColor = UIColor.gray.cgColor
		contentsContainer.layer.borderWidth = 1
		contentsContainer.layer.cornerRadius = 10
	}

	func toggleSelection() {
		guard let controller = questionsController, let category = category else { return }
		if controller.categoryIsSelected(category) {
			controller.deselect(category: category)
		} else {
			controller.select(category: category)
		}
		updateViews()
	}

	private func updateViews() {
		if let category = category {
			let categoryIsSelected = questionsController?.categoryIsSelected(category) ?? false
			titleLabel.textColor = categoryIsSelected ? .black : .gray
			contentsContainer.layer.borderColor = categoryIsSelected ? UIColor(named: "swiftlikeOrange")?.cgColor : UIColor.gray.cgColor
			contentsContainer.layer.borderWidth = categoryIsSelected ? 3 : 1
			titleLabel.text = category.rawValue
		}
	}
}
