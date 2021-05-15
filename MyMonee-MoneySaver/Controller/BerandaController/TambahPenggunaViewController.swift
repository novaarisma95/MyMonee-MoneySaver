//
//  TambahPenggunaViewController.swift
//  MyMonee-MoneySaver
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class TambahPenggunaViewController: UIViewController {
    
    @IBOutlet weak var buttonBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func backButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)

    }
    

}
