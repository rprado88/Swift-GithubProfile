//
//  FollowerView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 28/04/24.
//

import SwiftUI

struct FollowerView: View {
    
    let follower: Follower
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack{
                
                AsyncImage(url: URL(string: follower.avatarUrl ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                }
                .frame(width: 90, height: 90)
                
                Text(follower.login)
                    .font(.title3)
                    .bold()
            }
            .padding()
        }
    }
}

#Preview {
    FollowerView(follower: .init(login: "rprado88", avatarUrl: "url"))
}
