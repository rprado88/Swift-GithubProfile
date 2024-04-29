//
//  Profile.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import Foundation

struct Profile: Codable {
    
    let login: String
    let name: String
    let avatarUrl: String
    let bio: String
    
}
