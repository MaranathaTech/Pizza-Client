//
//  RequestHandler.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit
import Alamofire


class RequestHandler: NSObject {

    
    
    func returnAvailableToppings(completion: @escaping ((_ result: [[String : Any]]) -> Void)) {
        print("Getting Available Toppings!")
        
        self.getRequest(url: "http://0.0.0.0:3000/toppings") { (result) in
            completion(result)
        }
        
    }
    
    func returnAvailablePizzas(completion: @escaping ((_ result: [[String : Any]]) -> Void)) {
        print("Getting Available Pizzas!")
        
        self.getRequest(url: "http://0.0.0.0:3000/pizzas") { (result) in
            completion(result)
        }
        
    }
    
    
    func returnToppingsByID(completion: @escaping ((_ result: [[String : Any]]) -> Void), id:Int) {
        print("Getting Toppings For ID:\(id)!")
        
        self.getRequest(url: "http://0.0.0.0:3000/pizzas/"+String(id)+"/toppings") { (result) in
            completion(result)
        }
        
    }
    
    func writeNewPizza(completion: @escaping ((_ result: [String : Any]) -> Void), pizza:[String:Any]) {
        print("Writing New Pizza: \(pizza)!")
        
        self.postRequest(params: pizza, url: "http://0.0.0.0:3000/pizzas/") { (result) in
            completion(result)
        }
        
    }
    
    func writeNewTopping(completion: @escaping ((_ result: [String : Any]) -> Void), topping:[String:Any]) {
        print("Writing New Topping: \(topping)!")
        
        self.postRequest(params: topping, url: "http://0.0.0.0:3000/toppings/") { (result) in
            completion(result)
        }
        
    }
    
    func addToppingToPizza(completion: @escaping ((_ result: [String : Any]) -> Void), pizzaID:Int, toppingID:Int) {
        print("Adding Topping to Pizza ID: \(pizzaID)!")
        
        self.postRequest(params: ["topping_id" : toppingID], url: "http://0.0.0.0:3000/pizzas/"+String(pizzaID)+"/toppings") { (result) in
            completion(result)
        }
        
    }
    
    
    
    
    func getRequest(url:String , completion: @escaping ((_ result: [[String : Any]]) -> Void)) {
        print("GET Request")
        
        var result = [[String : Any]]()
        
        if  let myURL = URL(string: url){
        
        let headers = [
        "Content-Type": "application/json",
        "Accept": "application/json"
        ]
        
        Alamofire.request(myURL, method: .get, parameters: nil, encoding: JSONEncoding.default,headers: headers).responseJSON(completionHandler: { (response:DataResponse<Any>) in
        
        if let data = response.result.value{
        print(response.result.value ?? "")
        result = data as! [[String : Any]];
        completion(result);
        }
        else{
            result = [["error":"error"]];
            completion(result);
            }
        }
        
        )}
        
    }
       
        
    
    
    func postRequest(params:[String:Any], url:String , completion: @escaping ((_ result: [String : Any]) -> Void)) {
        print("POST Request")
        
        var result = [String : Any]()
        
        if  let myURL = URL(string: url){
            
            let headers = [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
            
            Alamofire.request(myURL, method: .post, parameters: params, encoding: JSONEncoding.default,headers: headers).responseJSON(completionHandler: { (response:DataResponse<Any>) in
                
                if let data = response.result.value{
                    print(response.result.value ?? "")
                    result = data as! [String : Any];
                    completion(result);
                }
                else{
                    result = ["error":"error"] as [String : Any];
                    completion(result);
                }
                
            }
                
                
            )}
        
    }
    
    
    
    
    
    
    
}
