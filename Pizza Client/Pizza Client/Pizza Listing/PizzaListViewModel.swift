//
//  PizzaListViewModel.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/26/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

protocol PizzaListDelegate {
    func requestComplete(obj:[[String:Any]])
}

class PizzaListViewModel: NSObject {
    
    var delegate:PizzaListDelegate?
    
    let pizzaListModel = PizzaListModel()
    
    //handler processes all GET and POST requests
    let handler = RequestHandler()
    
    func updateData(){
        handler.returnAvailablePizzas { (result) in
            self.pizzaListModel.pizzaArray = result
            self.delegate?.requestComplete(obj: self.pizzaListModel.pizzaArray)
        }
    }
    

    
}
