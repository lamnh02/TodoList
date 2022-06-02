//
//  ListViewModel.swift
//  TodoList
//
//  Created by Huu Lam Nguyen on 19/03/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    @Published var filteredItems: [ItemModel] = []
    
    let itemsKey: String = "item_list"
    
//    init sample data and sort by title
    init() {
        getItems()
        sortItemsByTitle()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItem
    }
    
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func sortItemsByTitle() {
        items = items.sorted { (item1, item2) -> Bool in
            return item1.title < item2.title
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
            
        }
    }
}
