//
//  HomeViewController.swift
//  iTip
//
//  Created by Ryan Liszewski on 11/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	@IBOutlet weak var billAmountTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		billAmountTextField.setBottomBorder()
    }
}

//MARK: - UITextField Extension
extension UITextField {
	func setBottomBorder(){
		self.borderStyle = .none
		self.layer.backgroundColor = UIColor.white.cgColor
		
		self.layer.masksToBounds = false
		self.layer.shadowColor = UIColor.gray.cgColor
		self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
		self.layer.shadowOpacity = 1.0
		self.layer.shadowRadius = 0.0
	}
}
