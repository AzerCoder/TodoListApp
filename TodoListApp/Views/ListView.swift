//
//  ListView.swift
//  TodoListApp
//
//  Created by A'zamjon Abdumuxtorov on 10/07/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var vm : ListViewModel
    
    var body: some View {
        ZStack{
            if vm.items.isEmpty{
              NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }else{
                List{
                    ForEach(vm.items,id: \.id) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    vm.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: vm.deleteItem)
                    .onMove(perform: vm.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
  
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}

