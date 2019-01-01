//
//  ToppingListView.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

class ToppingListView: UIViewController, ToppingListDelegate {
    
    func requestComplete(obj: [[String : Any]]) {
        self.tv.data = obj
        
        for err in obj {
            if (err["error"] != nil){
                self.createAlert(title: "Error", message: "Error Retrieving Topping List From Server.")
            }
        }
    }
    
    var pizzaID:Int?
    
    let tv = ToppingListTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    var viewModel:ToppingListViewModel = ToppingListViewModel()
    
    var cellSelected = false {
        didSet{
            self.dismiss(animated: true) {
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up nav bar
        self.title = "Select Topping"
        let plusBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addTopping(_:)))
        self.navigationItem.rightBarButtonItem = plusBtn
        
        //set up table view
        self.tv.viewController = self
        self.view.addSubview(tv)
        tv.data = viewModel.toppingListModel.toppingArray
        
        viewModel.delegate = self
        
        setConstraints()
    }
    
    let modalVC = ToppingCreateView()
    
    
    @objc func addTopping(_ sender:UIButton){
        //show add modal to add data
        modalVC.overlay.addTarget(self, action: #selector(removeModal(_:)), for: .touchUpInside)
        modalVC.saveBtn.addTarget(self, action: #selector(saveNewTopping(_:)), for: .touchUpInside)
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true, completion: nil)
    }
    
    @objc func removeModal(_ sender:UIButton){
        modalVC.dismiss(animated: true) {
        }
    }
    
    
    @objc func saveNewTopping(_ sender:UIButton){
        //add new item to array & run API query
        viewModel.handler.writeNewTopping(completion: { (result) in
            
            if result["error"] != nil {
                self.createAlert(title: "Error", message: "Error Saving New Topping To Server.")
            }
            else{
            //add result to pizza array
            self.viewModel.toppingListModel.toppingArray.append(result)
            self.tv.data = self.viewModel.toppingListModel.toppingArray
            }
        }, topping: ["name": modalVC.toppingTitle.text!])
        
        removeModal(modalVC.saveBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Reloading Table")
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

