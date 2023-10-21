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
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
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
             dueDate: Date().timeIntervalSince1970,
             createdDate: Date().timeIntervalSince1970,
            isDone: true))
    }
}
