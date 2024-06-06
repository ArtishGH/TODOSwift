//
//  ContentView.swift
//  ToDoList
//
//  Created by Bartek Prejs on 05/06/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // user signed in
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
