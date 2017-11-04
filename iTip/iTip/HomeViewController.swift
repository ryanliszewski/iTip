//
//  HomeViewController.swift
//  iTip
//
//  Created by Ryan Liszewski on 11/2/17.
//  Copyright © 2017 ImThere. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {




  @IBOutlet weak var tipSegmentedController: UISegmentedControl!
  @IBOutlet weak var billAmountTextField: UITextField!
  @IBOutlet weak var billAmountView: UIView!
  var billAmountViewCenter: CGPoint!
  var billAmountViewY: CGFloat!
  var heightKeyboard: CGFloat! {
    didSet {
    }
  }
  @IBOutlet weak var enterBillAmountLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShown(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    billAmountTextField.delegate = self
    //billAmountTextField.setBottomBorder()
    
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
    
    if(textField.text != nil){
      UIView.beginAnimations(nil, context: nil)
      UIView.setAnimationDuration(0.3)
      enterBillAmountLabel.alpha = 0
      self.billAmountView.center = CGPoint(x: self.billAmountView.center.x, y: self.billAmountView.center.y / 1.2)
      
     
      self.billAmountTextField.setSelectedBottomBorder()

      
      UIView.commitAnimations()
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
    self.backgroundColor = #colorLiteral(red: 0.4692698717, green: 0.6561034322, blue: 0.4752988815, alpha: 1)
		self.layer.masksToBounds = false
		self.layer.shadowColor = UIColor.gray.cgColor
		self.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
		self.layer.shadowOpacity = 1.0
		self.layer.shadowRadius = 0.0
	}
  func setSelectedBottomBorder(){
    self.borderStyle = .none
    self.backgroundColor = #colorLiteral(red: 0.4692698717, green: 0.6561034322, blue: 0.4752988815, alpha: 1)
    self.layer.masksToBounds = false
    self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    self.layer.shadowColor = UIColor.white.cgColor
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 1.0
  }
}

