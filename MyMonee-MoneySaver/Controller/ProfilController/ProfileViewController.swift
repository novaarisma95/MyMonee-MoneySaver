//
//  ProfileViewController.swift
//  MyMonee-MoneySaver
//
//  Created by MacBook on 12/05/21.
//

import UIKit

class ProfileViewController: UIViewController {
 
    var name: String = ""
    var descStatus: String = ""
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var decribeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileView.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
        
      

        nameLabel.text = "\(name)"
        decribeLabel.text = "\(descStatus)"
        
    }
    
    @IBAction func buttonEdit(_ sender: Any) {
        let controller = EditProfilViewController(nibName: String(describing: EditProfilViewController.self), bundle: nil)
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    


    

}
