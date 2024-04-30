//
//  MainViewViewModel.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import Foundation

class MainViewViewModel: ObservableObject{
    
    @Published var userName: String
    
    init(userName: String) {
        self.userName = userName
    }
    
}
