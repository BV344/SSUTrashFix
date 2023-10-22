//
//  LogView.swift
//  TrashFix
//
//  Created by Isaac Salzman on 10/22/23.
//

import SwiftUI
import Foundation

struct LogView: View {
    var trashFixItems: [TrashFixItem]

    var body: some View {
            List(trashFixItems) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .padding(.bottom, 5)
                    if let filledDate = item.filledDate {
                        Text("Filled: \(formattedDate(filledDate)), \(formattedTime(filledDate))")
                            .foregroundColor(.green)
                    } else {
                        Text("Filled: None")
                            .foregroundColor(.green)
                    }
                    if let unfilledDate = item.unfilledDate {
                        Text("Unfilled: \(formattedDate(unfilledDate)), \(formattedTime(unfilledDate))")
                            .foregroundColor(.red)
                    } else {
                        Text("Unfilled: None")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                .background(Color(white: 0.9))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
        }

    private func formattedDate(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: date)
        }

        private func formattedTime(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
}

//struct LogView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogView(trashFixItems: trashFixItems)
//    }
//}
