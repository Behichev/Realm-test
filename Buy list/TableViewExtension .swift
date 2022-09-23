//
//  TableViewEtension .swift
//  Buy list
//
//  Created by Иван Бегичев on 23.09.2022.
//

import Foundation
import UIKit

extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return buyList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") {
            
            let item = buyList[indexPath.row]
            
            cell.textLabel?.text = item.title
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
            dateFormatter.locale = Locale(identifier: "ua")
            
            cell.detailTextLabel?.text = dateFormatter.string(from: item.addData)
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let item = buyList[indexPath.row]
        
        if editingStyle == .delete {
            RealmDataManager().delete(object: item)
        }
        
        self.buyList.remove(at: indexPath.row)
        
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
        
    }
    
}
