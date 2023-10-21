//
//  TFButton.swift
//  TrashFix
//
//  Created by Brayan Vizcaino on 10/20/23.
//

import SwiftUI

struct TFButton: View {
    let title: String
    let background: Color
    let action: ()->Void
    var body: some View {
        Button{
            //Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                
            }
        }
    }
}

struct TFButton_Previews: PreviewProvider {
    static var previews: some View {
        TFButton(title: "Value",
                 background: .pink){
            //Action
        }
    }
}
