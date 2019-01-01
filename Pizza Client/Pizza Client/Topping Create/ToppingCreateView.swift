//
//  ToppingCreateView.swift
//  topping Client
//
//  Created by Ernie Lail on 12/27/18.
//  Copyright © 2018 Development. All rights reserved.
//

import UIKit

class ToppingCreateView: UIViewController {
    
    let heading = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let overlay = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let toppingTitle = UITextField(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let saveBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up VC for modal look
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        
        //title input
        toppingTitle.backgroundColor = UIColor.white
        toppingTitle.layer.cornerRadius = 14
        toppingTitle.clipsToBounds = true
        toppingTitle.textAlignment = .center
        toppingTitle.borderStyle = .line
        toppingTitle.layer.borderWidth = 1
        toppingTitle.layer.borderColor = UIColor.lightGray.cgColor
        toppingTitle.placeholder = "topping Name"
        
        //heading
        heading.text = "Create New Topping"
        heading.textAlignment = .center
        
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
        view.addSubview(toppingTitle)
        view.addSubview(heading)
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
        
        
        toppingTitle.translatesAutoresizingMaskIntoConstraints = false
        toppingTitle.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        toppingTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toppingTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        toppingTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80).isActive = true
        heading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heading.topAnchor.constraint(equalTo: toppingTitle.topAnchor, constant: -60).isActive = true
        heading.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveBtn.topAnchor.constraint(equalTo: toppingTitle.bottomAnchor, constant: +10).isActive = true
        saveBtn.widthAnchor.constraint(equalToConstant: 125).isActive = true
        saveBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
}
