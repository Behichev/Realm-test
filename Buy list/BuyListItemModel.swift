//
//  BuyListItemModel.swift
//  Buy list
//
//  Created by Иван Бегичев on 23.09.2022.
//

import Foundation
import RealmSwift

@objcMembers
class BuyListItem: Object {
    
    dynamic var title: String = ""
    dynamic var addData = Date()
    
}
