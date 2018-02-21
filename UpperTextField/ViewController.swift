//
//  ViewController.swift
//  UpperTextField
//
//  Created by Maribel Montejano on 2/20/18.
//  Copyright © 2018 Maribel Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK:- Outlet
  @IBOutlet weak var upperTextField: UITextField!
  @IBOutlet weak var fiveTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Make ViewController class the delegate of the text field
    upperTextField.delegate = self
    fiveTextField.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK:- Protocol Methods
  // 1) Asks the delegate if the text field should process the pressing of the return button. Text field calls this method when the user taps the return button. Returns true if the text field should its default behavior for the return button; otherwise return false
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // relinquish its status as the first responder
    textField.resignFirstResponder()
    
    return true
  }
  
  // 2) Asks the delegate if the specified text should be changed
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    // anytime a character is entered in the text field, this method is called
    print("shouldChangeCharactersIn called with \(string)")
    
    var allowChange = true
    
    if string == "" {
      allowChange = true
    } else {
      if textField.text != nil {
        // change the characters to uppercase
        textField.text! += string.uppercased()
        allowChange = false
      }
    }
    
    // returns true if the specified text should be changed; otherwise, false to keep the old text
    return allowChange
  }
  
}
