//
//  CstomTextField.swift
//  TripManagerApp
//
//  Created by Mehtab on 22/05/2017.
//  Copyright © 2017 Mehtab. All rights reserved.
//

import UIKit

class CustomTextField: UITextField , UITextFieldDelegate{

    //MARK: Text Field Delegates
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = self;
    }
    
  
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

}
