//
//  PizzaListTableView.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/26/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

class PizzaListTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
   
    var viewController:PizzaListView?
    
    var data:[[String:Any]] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //on press load the pizza's incredients
        let itemView = PizzaDetailView()
        itemView.viewModel.pizzaDetailModel.pizzaData = data[indexPath.row]
        viewController!.navigationController?.pushViewController(itemView, animated: true)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        if let name = data[indexPath.row]["name"] as? String {
        cell.textLabel?.text = name + " Pizza"
        //print(cell.textLabel?.text ?? "Cell Text Not Set")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame:frame, style: style)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
