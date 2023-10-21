//
//  TrashFixItemView.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import SwiftUI

struct TrashFixItemView: View {
    @StateObject var viewModel = TrashFixItemViewViewModel()
    
    let item: TrashFixItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text(item.trashFixID)
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
           
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct TrashFixItemView_Previews: PreviewProvider {
    static var previews: some View {
        TrashFixItemView(item: .init(id: "123",
             title: "Get Milk",
             trashFixID: "12345",
             isDone: true))
    }
}
