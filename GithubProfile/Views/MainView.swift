//
//  ContentView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct MainView: View {
    
    var model: Profile!
    
    init(userProfile: Profile!) {
        self.model = userProfile
        
        print("MainView - userProfile \(String(describing: self.model))")
    }
    
    var body: some View {
        VStack {
            
            if(model != nil)
            {
                accountView
            }
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ProfileView(userName: model.name ?? "No name", userLogin: model.login ?? "No login", userBio: model.bio ?? "No Bio", userAvatar: model.avatarUrl ?? "No Avatar")
                .tabItem{
                    Label("Profile", systemImage: "person.crop.circle")
                }
            FollowersView(userName: model.login ?? "")
                .tabItem{
                    Label("Followers", systemImage: "list.bullet")
                }
        }
    }
}
