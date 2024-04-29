//
//  HeaderView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
            
            Image("GitLogo")
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView()
}
