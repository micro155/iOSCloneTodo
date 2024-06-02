//
//  AddView.swift
//  cloneTodoApp
//
//  Created by MAYDAY on 2/11/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @FocusState private var focusedTextField: Bool
    var listViewModel: ListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .focused($focusedTextField)
                    .onAppear {
                        focusedTextField = true
                    }
                
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                }
            }
            .padding(16)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters"
            showAlert.toggle()
            return false
        } else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView(listViewModel: ListViewModel())
        }
    }
}

