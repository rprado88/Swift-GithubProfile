//
//  ContentView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        VStack {
            
            if viewModel.userFound, !viewModel.userName.isEmpty{
                accountView
            } else {
                SearchView()
            }
            
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ProfileView(userName: viewModel.userName)
                .tabItem{
                    Label("Profile", systemImage: "person.crop.circle")
                }
            FollowersView(userName: viewModel.userName)
                .tabItem{
                    Label("Followers", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    MainView()
}
