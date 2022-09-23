//
//  ViewController.swift
//  Buy list
//
//  Created by Иван Бегичев on 23.09.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
   
    var buyList: [BuyListItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInterface()
        buyList = RealmDataManager().obtainItems()
        
    }
    
    private func setupInterface() {
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
    }
    
    @IBAction func whenAddButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add item", message: "Add item to your buy list", preferredStyle: .alert)
        
        alert.addTextField()
        
        let actionAdd = UIAlertAction(title: "Add", style: .default, handler:  { action in
            
            let item = BuyListItem()
            item.setValue(alert.textFields?.first?.text, forKey: "title")
            item.setValue(Date.now, forKey: "addData")
  
            RealmDataManager().save(item: item)
            
            self.buyList = RealmDataManager().obtainItems()
            
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        })
       
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(actionAdd)
        alert.addAction(actionCancel)
        
        present(alert, animated: true)
    }
    
}

