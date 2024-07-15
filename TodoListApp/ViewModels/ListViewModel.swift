//
//  ListViewModel.swift
//  TodoListApp
//
//  Created by A'zamjon Abdumuxtorov on 15/07/24.
//

import Foundation

class ListViewModel:ObservableObject{
    
    @Published var items : [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
      getItems()
    }
    
    func getItems(){
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = saveItems
    }
  
    
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
        saveItems()
    }
    
    func moveItem(from: IndexSet,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String){
        let newItem = ItemModel(title: title, isComplited: false)
        items.append(newItem)
    }
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateComplition()
        }
    }
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
       
    }
}
