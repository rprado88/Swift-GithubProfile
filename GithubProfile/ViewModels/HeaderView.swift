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
            
        }
        .overlay(Image(("gitlogo")).resizable().frame(width: 120, height: 120))
        .edgesIgnoringSafeArea(.top)
        .frame(width: UIScreen.main.bounds.width * 2, height: 200)
        .offset(y: 10)
        
        VStack{
            Text("GitHub Profile")
            .font(.system(size: 30))
            .bold()
        }
    }
}

#Preview {
    HeaderView()
}
