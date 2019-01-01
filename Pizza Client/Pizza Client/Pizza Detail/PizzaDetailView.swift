//
//  PizzaDetailView.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

class PizzaDetailView: UIViewController, PizzaDetailDelegate {

    func requestComplete(obj: [[String : Any]]) {
        self.tv.data = obj
        
        for err in obj {
            if (err["error"] != nil){
            self.createAlert(title: "Error", message: "Error Retrieving Pizza's Toppings From Server.")
        }
        }
    }
        
    let tv = PizzaDetailTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    var viewModel:PizzaDetailViewModel = PizzaDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up nav bar
        let pizzaName = viewModel.pizzaDetailModel.pizzaData["name"] as? String
        self.title =  pizzaName! + " Toppings"
        let plusBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addTopping(_:)))
        self.navigationItem.rightBarButtonItem = plusBtn
        
        //set up table view
        self.view.addSubview(tv)
        tv.data = viewModel.pizzaDetailModel.toppingsArray
                
        viewModel.delegate = self
        
        setConstraints()
    }
    
    let modalVC = ToppingListView()
    
    @objc func addTopping(_ sender:UIButton){
        //show add VC to add data
        modalVC.pizzaID = viewModel.pizzaDetailModel.pizzaData["id"] as? Int
        self.navigationController?.pushViewController(modalVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Reloading Table")
        viewModel.updateData(pizzaID: viewModel.pizzaDetailModel.pizzaData["id"] as! Int)
    }
    
    
    func setConstraints(){
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

}
