//
//  BerandaViewController.swift
//  MyMonee-MoneySaver
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class BerandaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var outcomeIncomeCollectionView: UICollectionView!
    @IBOutlet weak var viewBalance: ViewSaldo!
    @IBOutlet weak var viewRiwayat: UIView!
    @IBOutlet weak var riwayatTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRiwayat.layer.cornerRadius = 16
        viewBalance.layer.cornerRadius = 8
        
        
        
        riwayatTableView.delegate = self
        riwayatTableView.dataSource = self
        
        //collection
        outcomeIncomeCollectionView.delegate = self
        outcomeIncomeCollectionView.dataSource = self
        
        
        let uiNib = UINib(nibName: String(describing: RiwayatTableViewCell.self), bundle: nil)
        riwayatTableView.register(uiNib, forCellReuseIdentifier: String(describing: RiwayatTableViewCell.self))
        
        //collection
        let uiNibCollectionView = UINib(nibName: String(describing: TransactionCollectionViewCell.self), bundle: nil)
        outcomeIncomeCollectionView.register(uiNibCollectionView, forCellWithReuseIdentifier: String(describing: TransactionCollectionViewCell.self))
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        let controller1 = TambahPenggunaViewController(nibName: String(describing: TambahPenggunaViewController.self), bundle: nil)
        
        controller1.modalPresentationStyle = .fullScreen
        controller1.modalTransitionStyle = .coverVertical
        
        self.navigationController?.pushViewController(controller1, animated: true)
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riwayatPenggunaan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //! adalah forceCasting
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RiwayatTableViewCell.self), for: indexPath) as! RiwayatTableViewCell
        
        //untuk masukkan nilai
        cell.descriptionRiwayat.text = riwayatPenggunaan[indexPath.row].description
        cell.dateRiwayar.text = riwayatPenggunaan[indexPath.row].date
        cell.priceDesc.text = riwayatPenggunaan[indexPath.row].priceDesc
        
        if riwayatPenggunaan[indexPath.row].status{
            cell.imageRow.image = UIImage(named: "Frame 22-1")
            cell.priceDesc.textColor = UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1)
        } else {
            cell.imageRow.image = UIImage(named: "Frame 22")
            cell.priceDesc.textColor = UIColor(red: 0.129, green: 0.588, blue: 0.325, alpha: 1)
        }
        
        //design
        cell.priceDesc.font = UIFont(name: "Poppins-SemiBold", size: 14)
        cell.dateRiwayar.textColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1)
        cell.dateRiwayar.font = UIFont(name: "Poppins-Regular", size: 11)
        cell.descriptionRiwayat.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        cell.descriptionRiwayat.font = UIFont(name: "Poppins-Medium", size: 14)
        
        return cell
    }
    
    //collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollection = outcomeIncomeCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TransactionCollectionViewCell.self), for: indexPath) as! TransactionCollectionViewCell
        
        cellCollection.title.text = data[indexPath.row].description
        cellCollection.priceTransaction.text = data[indexPath.row].totalPrice
        
        cellCollection.layer.cornerRadius = 4
        
        if data[indexPath.row].statusOutcome {
            cellCollection.arrowTransaction.image = UIImage(named: "arrow_downward_24px")
        } else {
            cellCollection.arrowTransaction.image = UIImage(named: "arrow_upward_24px")
        }
        
        return cellCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: outcomeIncomeCollectionView.frame.width / 2 - (10), height: 47)

    }


}
