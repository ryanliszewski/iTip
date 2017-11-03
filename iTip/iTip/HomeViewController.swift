//
//  HomeViewController.swift
//  iTip
//
//  Created by Ryan Liszewski on 11/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var billAmountViewHeight: NSLayoutConstraint!
  @IBOutlet weak var billAmountTextField: UITextField!
  @IBOutlet weak var billAmountView: UIView!
  var billAmountViewCenter: CGPoint!
  var billAmountViewY: CGFloat!
  var heightKeyboard: CGFloat! {
    didSet {
       billAmountViewHeight.constant = self.view.frame.height - heightKeyboard
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    billAmountTextField.becomeFirstResponder()
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShown(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    billAmountTextField.delegate = self
  }
  
  func keyboardShown(notification: NSNotification) {
    if let infoKey  = notification.userInfo?[UIKeyboardFrameEndUserInfoKey],
      let rawFrame = (infoKey as AnyObject).cgRectValue {
      let keyboardFrame = view.convert(rawFrame, from: nil)
      self.heightKeyboard = keyboardFrame.size.height
    }
  }
  
}

//MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
  public func textFieldDidBeginEditing(_ textField: UITextField){
    UIView.animate(withDuration: 0.4) {
      self.billAmountViewHeight.constant = self.billAmountViewHeight.constant / 2.0

    }
  }
  
  public func textFieldDidEndEditing(_ textField: UITextField) {
    UIView.animate(withDuration: 0.4) {
      self.billAmountView.center = CGPoint(x: self.billAmountView.center.x, y: self.billAmountView.center.y * 2)
    }
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

