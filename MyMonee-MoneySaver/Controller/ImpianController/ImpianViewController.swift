//
//  ImpianViewController.swift
//  MyMonee-MoneySaver
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class ImpianViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var impianTableView: UITableView!
    
    @IBOutlet var impianSuperView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        impianTableView.delegate = self
        impianTableView.dataSource = self
        impianSuperView.layer.backgroundColor = UIColor(red: 0.941, green: 0.949, blue: 0.973, alpha: 1).cgColor
        impianTableView.layer.backgroundColor = UIColor(red: 0.941, green: 0.949, blue: 0.973, alpha: 1).cgColor
        
        
        
        let uiNib = UINib(nibName: String(describing: ImpianTableViewCell.self), bundle: nil)
        impianTableView.register(uiNib, forCellReuseIdentifier: String(describing: ImpianTableViewCell.self))
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return impianList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImpianTableViewCell.self), for: indexPath) as! ImpianTableViewCell
        
        cell.title.text = impianList[indexPath.row].descriptionImpian
        cell.price.text = impianList[indexPath.row].priceImpian
        cell.proggressCell.progress = impianList[indexPath.row].impianProgress
        
        
        return cell
    }



}
