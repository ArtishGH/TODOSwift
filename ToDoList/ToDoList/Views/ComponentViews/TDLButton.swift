//
//  TDLButton.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import SwiftUI

struct TDLButton: View {
    
    let title: String
    let backgroundColor: Color
    let titleColor: Color
    let action: () -> Void
    
    var body: some View {
        Button (
            action: {
                action()
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(backgroundColor)
                    
                    Text(title)
                        .foregroundColor(titleColor)
                        .bold()
                }
                
            }).padding()
    }
}

#Preview {
    TDLButton(title: "Button", backgroundColor: Color.blue, titleColor: Color.white) {
        // Action
    }
}
