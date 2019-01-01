//
//  ToppingListViewModel.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

protocol ToppingListDelegate {
    func requestComplete(obj:[[String:Any]])
}

class ToppingListViewModel: NSObject {

    var delegate:ToppingListDelegate?
    
    let toppingListModel = ToppingListModel()
    
    //handler processes all GET and POST requests
    let handler = RequestHandler()
    
    func updateData(){
        handler.returnAvailableToppings { (result) in
            self.toppingListModel.toppingArray = result
            self.delegate?.requestComplete(obj: self.toppingListModel.toppingArray)
        }
    }
    
    
}
