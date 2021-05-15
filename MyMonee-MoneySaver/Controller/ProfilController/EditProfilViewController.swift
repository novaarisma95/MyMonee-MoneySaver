//
//  EditProfilViewController.swift
//  MyMonee-MoneySaver
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class EditProfilViewController: UIViewController {
    
    @IBOutlet weak var editProfilView: UIView!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputStatus: UITextField!
    @IBOutlet weak var inputPictures: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editProfilView.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
    }

    @IBAction func buttonDone(_ sender: Any) {
        
        let name = inputName.text ?? ""
        let descStatus = inputStatus.text ?? ""
        
        let viewController = ProfileViewController(nibName: String(describing: ProfileViewController.self), bundle: nil)
        
        viewController.name = name
        viewController.descStatus = descStatus
    
        self.present(viewController, animated: true, completion: nil)
       // self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    

}
