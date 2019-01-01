//
//  Extensions.swift
//  Pizza Client
//
//  Created by Ernie Lail on 1/1/19.
//  Copyright © 2019 Development. All rights reserved.
//

import UIKit

class Extensions: NSObject {

    
    
}

extension UIViewController {
    
    func createAlert(title:String, message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            
            
            alert.dismiss(animated: true) {
                
                print("ok")
            }}))
        
        
        self.present(alert, animated: true) {
        }
        
        
        
    }
    
}
