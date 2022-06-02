//
//  AddView.swift
//  TodoList
//
//  Created by Huu Lam Nguyen on 18/03/2022.
//

import SwiftUI

struct AddView: View {
    
//    back one hierchy - back view after save done
    @Environment(\.presentationMode) var presentationMode

    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State private var showingAlert = false

    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Write something...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(red: 225/255, green: 230/255, blue: 226/255))
                    .cornerRadius(10)
                Button(action: saveActionPressed, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                    .alert("at least 2 characters", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) { }
                            }
            }
            .padding(15)
        }
        .navigationTitle("Add an item")
    }
    func saveActionPressed() {
        if checkTextLength() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
            listViewModel.sortItemsByTitle()
        }
    }
    
    func checkTextLength() -> Bool {
        if (textFieldText.count < 2) {
            showingAlert = true
            return false
        }
        return true
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}


