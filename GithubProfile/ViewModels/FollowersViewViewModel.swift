//
//  FollowersViewViewModel.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import Foundation

class FollowersViewViewModel: ObservableObject {
    
    @Published var followers: [Follower]? = nil
    
    init(){}
    
    func getFollowersByUserName(userName: String) async -> [Follower]
    {
        do
        {
            followers = try await ProfileService().getFollowers(userName: userName)
        } catch {
        
        }
        
        return followers!
    }
    
}
