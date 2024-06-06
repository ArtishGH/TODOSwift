//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "TODO List", subtitle: "Start adding your tasks", angle: 0, backgroundColor: Color.blue).offset(y: -30)
            
            
            
            Spacer()
        }
    }
}

#Preview {
    ToDoListView()
}
