//
//  AddView.swift
//  TodoListApp
//
//  Created by A'zamjon Abdumuxtorov on 10/07/24.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var vm : ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var textField:String = ""
    
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here....", text: $textField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button {
                    saveButton()
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }

            }.padding(16)
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton(){
        if textIsAppropiate(){
            vm.addItem(title: textField)
            dismiss()
        }
       
    }
    
    func textIsAppropiate()-> Bool{
        if textField.count < 3{
            alertTitle = "Your new todo items must be at least 3 characters long!!! 😱😨😰"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() ->Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
