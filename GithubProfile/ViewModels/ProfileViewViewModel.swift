//
//  ProfileViewViewModel.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import Foundation

class ProfileViewViewModel: ObservableObject {
    
    @Published var profile: Profile? = nil
    
    init(){}
    
    func getProfile(userName: String) async -> Profile
    {
        do
        {
            profile = try await ProfileService().getUserProfile(userName: userName)
        } catch {
        
        }
        
        return profile!
    }
}
