//
//  PizzaListView.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/26/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

class PizzaListView: UIViewController, PizzaListDelegate {
    
    func requestComplete(obj: [[String : Any]]) {
        self.tv.data = obj
        
        for err in obj {
            if (err["error"] != nil){
                self.createAlert(title: "Error", message: "Error Retrieving Pizza Listing From Server.")
            }
        }
    }
    
    let tv = PizzaListTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    var viewModel:PizzaListViewModel = PizzaListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up nav bar
        self.title = "Pizzas"
        let plusBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addPizza(_:)))
        self.navigationItem.rightBarButtonItem = plusBtn

        //set up table view
        self.tv.viewController = self
        self.view.addSubview(tv)
        tv.data = viewModel.pizzaListModel.pizzaArray
        
        viewModel.delegate = self
        
        setConstraints()
    }
    
    let modalVC = PizzaCreateView()

    
    @objc func addPizza(_ sender:UIButton){
        //show add modal to add data
        modalVC.overlay.addTarget(self, action: #selector(removeModal(_:)), for: .touchUpInside)
        modalVC.saveBtn.addTarget(self, action: #selector(saveNewPizza(_:)), for: .touchUpInside)
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true, completion: nil)
    }
    
    @objc func removeModal(_ sender:UIButton){
        modalVC.dismiss(animated: true) {
        }
    }
    

    @objc func saveNewPizza(_ sender:UIButton){
     //add new item to array & run API query
        viewModel.handler.writeNewPizza(completion: { (result) in

            if result["error"] != nil {
                self.createAlert(title: "Error", message: "Error Saving New Pizza To Server.")
            }
            else{
            //add result to pizza array
            self.viewModel.pizzaListModel.pizzaArray.append(result)
            self.tv.data = self.viewModel.pizzaListModel.pizzaArray
            }
            
        }, pizza: ["name": modalVC.pizzaTitle.text!, "description":modalVC.pizzaDesc.text!])
        
        removeModal(modalVC.saveBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.updateData()
    }
    
    func setConstraints(){
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }


}

