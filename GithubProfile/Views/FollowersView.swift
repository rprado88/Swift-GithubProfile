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
    
    init(userName: String)
    {
    }
    
    var body: some View {
        VStack {
            List(items ?? emptyArray, id: \.login) { follower in
                FollowerView(follower: follower)
            }.listStyle(PlainListStyle())
        }
        .task {
            do {
                items = try await viewModel.getFollowersByUserName(userName: "rprado88")
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
