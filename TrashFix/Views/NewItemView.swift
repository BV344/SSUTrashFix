//
//  NewItemView.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    
    var body: some View {
        VStack {
            
            // Cancel Button
            HStack {
                    Button(action: {
                        newItemPresented = false
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .font(.title)
                    })
                    Spacer()
                }
                .padding()
            
            Text("New TrashFix Device")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //
                //Text Field Id
                TextField("TrashFix Device ID", text: $viewModel.trashFixID)
                    .textFieldStyle(DefaultTextFieldStyle())
                //
                
                //Button
                TFButton(title: "Save",
                         background: .pink) {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer."))
            }
        }
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
