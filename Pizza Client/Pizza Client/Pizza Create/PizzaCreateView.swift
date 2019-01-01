//
//  PizzaCreateView.swift
//  Pizza Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

class PizzaCreateView: UIViewController {

    let heading = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let overlay = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let pizzaTitle = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let pizzaDesc = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let saveBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()

        //set up VC for modal look
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        //title input
        pizzaTitle.backgroundColor = UIColor.white
        pizzaTitle.layer.cornerRadius = 14
        pizzaTitle.clipsToBounds = true
        pizzaTitle.textAlignment = .center
        pizzaTitle.borderStyle = .line
        pizzaTitle.layer.borderWidth = 1
        pizzaTitle.layer.borderColor = UIColor.lightGray.cgColor
        pizzaTitle.placeholder = "Pizza Name"
        
        //heading
        heading.text = "Create New Pizza"
        heading.textAlignment = .center
        
        //description input
        pizzaDesc.backgroundColor = UIColor.white
        pizzaDesc.layer.cornerRadius = 14
        pizzaDesc.clipsToBounds = true
        pizzaDesc.textAlignment = .center
        pizzaDesc.borderStyle = .line
        pizzaDesc.layer.borderWidth = 1
        pizzaDesc.layer.borderColor = UIColor.lightGray.cgColor
        pizzaDesc.placeholder = "Pizza Description"

        //add shadow overlay
        overlay.backgroundColor = UIColor.white
        overlay.alpha = 0.8
        
        //save button
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.setTitleColor(UIColor.white, for: .normal)
        saveBtn.layer.cornerRadius = 14
        saveBtn.clipsToBounds = true
        saveBtn.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        view.addSubview(overlay)
        view.addSubview(pizzaTitle)
        view.addSubview(heading)
        view.addSubview(pizzaDesc)
        view.addSubview(saveBtn)
        
        //set constraints
        setConstraints()
    }
    
    
    func setConstraints(){
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        overlay.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
   
        
        pizzaTitle.translatesAutoresizingMaskIntoConstraints = false
        pizzaTitle.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        pizzaTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pizzaTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pizzaTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        heading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heading.topAnchor.constraint(equalTo: pizzaTitle.topAnchor, constant: -60).isActive = true
        heading.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pizzaDesc.translatesAutoresizingMaskIntoConstraints = false
        pizzaDesc.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        pizzaDesc.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pizzaDesc.topAnchor.constraint(equalTo: pizzaTitle.bottomAnchor, constant: +10).isActive = true
        pizzaDesc.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveBtn.topAnchor.constraint(equalTo: pizzaDesc.bottomAnchor, constant: +10).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: 125).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    


}
