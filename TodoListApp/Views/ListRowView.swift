//
//  ListRowView.swift
//  TodoListApp
//
//  Created by A'zamjon Abdumuxtorov on 10/07/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item:ItemModel
    
    var body: some View {
        HStack{
            Image(systemName:item.isComplited ? "checkmark.circle":"xmark")
                .foregroundColor(item.isComplited ? .green: .red)
            Text(item.title)
            Spacer()
        }
    }
}


#Preview {
    ListRowView(item: ItemModel(title: "defrgtrew", isComplited: true))
}
