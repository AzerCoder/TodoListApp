//
//  ItemModel.swift
//  TodoListApp
//
//  Created by A'zamjon Abdumuxtorov on 10/07/24.
//

import Foundation

struct ItemModel:Identifiable,Codable{
    let id:String
    let title:String
    let isComplited:Bool
    
    init(id:String = UUID().uuidString, title: String, isComplited: Bool) {
        self.id = id
        self.title = title
        self.isComplited = isComplited
    }
    
    func updateComplition() ->ItemModel{
        return ItemModel(id: id, title: title, isComplited: !isComplited)
    }
}
