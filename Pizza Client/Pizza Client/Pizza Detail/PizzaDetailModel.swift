//
//  PizzaDetailModel.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

class PizzaDetailModel: NSObject {

    //contains the pizza data. Get's passed from PizzaListTableView
    var pizzaData = [String:Any]()
    
    //contains array of objects with keys: id,name, pizza_id & topping_id
    var toppingsArray = [[String:Any]]()
    
    //Example
    //id = 3;
    //name = Pepperoni;
    //"pizza_id" = 2;
    //"topping_id" = 2;
  
    
}
