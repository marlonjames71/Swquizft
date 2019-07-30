//
//  MainViewController
//  Swquizft
//
//  Created by Michael Redig on 7/29/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
	@IBOutlet var difficultyButtons: [UIButton]!
	@IBOutlet var easyButton: UIButton!
	@IBOutlet var mediumButton: UIButton!
	@IBOutlet var hardButton: UIButton!
	@IBOutlet var categoryCollection: UICollectionView!
	let categoryDelegate = CategoryCollectionDelegate()

	override func viewDidLoad() {
		super.viewDidLoad()
		categoryCollection.delegate = categoryDelegate
		categoryCollection.dataSource = categoryDelegate
		categoryCollection.allowsMultipleSelection = true

		easyButton.isSelected = true
	}


	@IBAction func difficultyPressed(_ sender: UIButton) {
		difficultyButtons.forEach { $0.isSelected = sender == $0 }
		categoryCollection.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)

	}

	@IBAction func goButtonPressed(_ sender: UIButton) {
	}
}

