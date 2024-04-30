//
//  FollowersView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct FollowersView: View {
    
    var viewModel = FollowersViewViewModel()
    
    @State private var items: [Follower]?
    
    var emptyArray = [Follower]()
    
    var userName = ""
    
    init(userName: String)
    {
        self.userName = userName
        print("FollowersView - userName \(self.userName)")
    }
    
    var body: some View {
        VStack {
            List(items ?? emptyArray, id: \.login) { follower in
                FollowerView(follower: follower)
            }.listStyle(PlainListStyle())
        }
        .task {
            do {
                items = try await viewModel.getFollowersByUserName(userName: userName)
            } catch Errors.invalidURL {
                print("Invalid URL")
            }
            catch Errors.invalidResponse {
                print("Invalid response")
            }
            catch Errors.invalidData {
                print("Invalid data")
            }
            catch {
                print("Unexepected error")
            }
        }
        
    }
}

#Preview {
    FollowersView(userName: "rprado88")
}
