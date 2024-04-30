//
//  ProfileView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct ProfileView: View {
    
    var viewModel = ProfileViewViewModel()
    
    var name = ""
    var login = ""
    var bio = ""
    var avatar = ""
    
    init(userName: String, userLogin: String, userBio: String, userAvatar: String){
        
        self.name = userName
        self.login = userLogin
        self.bio = userBio
        self.avatar = userAvatar
    }
    
    var body: some View {
        VStack(spacing:  20) {
            
            Spacer()
            
            Form{
                AsyncImage(url: URL(string: avatar)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                }
                .frame(width: 120, height: 120)
                
                Text(name)
                    .bold()
                    .font(.title3)
                
                Text(login)
                    .bold()
                    .font(.title3)
                
                Text(bio)
                    .padding()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView(userName: "", userLogin: "", userBio: "", userAvatar: "")
}
