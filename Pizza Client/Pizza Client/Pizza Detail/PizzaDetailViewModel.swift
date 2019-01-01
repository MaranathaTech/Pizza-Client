//
//  PizzaDetailViewModel.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

protocol PizzaDetailDelegate {
    func requestComplete(obj:[[String:Any]])
}

class PizzaDetailViewModel: NSObject {

    var delegate:PizzaDetailDelegate?
    
    let pizzaDetailModel = PizzaDetailModel()
        
    //handler processes all GET and POST requests
    let handler = RequestHandler()
    
    func updateData(pizzaID:Int) {
        print("Getting Updated Data From Server")
        handler.returnToppingsByID(completion: { (result) in
            self.pizzaDetailModel.toppingsArray = result
            self.delegate?.requestComplete(obj: self.pizzaDetailModel.toppingsArray)
        }, id: pizzaID)
    }
    
    
    
    
    
    
}
