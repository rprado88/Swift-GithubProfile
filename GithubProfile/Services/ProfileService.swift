//
//  ProfileService.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import Foundation

class ProfileService{
    
    let endpoint = "https://api.github.com/users/"
    
    init(){}
    
    func getUserProfile(userName: String) async throws -> Profile {
        
        let urlString = endpoint + userName
        
        guard let url = URL(string: urlString) else {
            throw Errors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse{
            if httpResponse.statusCode != 200 {
                print("error \(httpResponse.statusCode)")
                throw Errors.invalidResponse
            }
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(Profile.self, from: data)
        } catch {
            print("error - invalid data")
            throw Errors.invalidData
        }
    }
    
    func getFollowers(userName: String) async throws -> [Follower] {
        
        let urlString = endpoint + userName + "/followers"
        
        guard let url = URL(string: urlString) else {
            throw Errors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw Errors.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode([Follower].self, from: data)
        } catch {
            throw Errors.invalidData
        }
    }
}
