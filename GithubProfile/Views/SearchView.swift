//
//  SearchView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewViewModel()
    
    var body: some View {
            VStack {
                
                HeaderView()
                
                Form{
                    TextField("User Name", text: $viewModel.userName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    Spacer()
                    
                    Button {
                        // Action
                        print("search by \(viewModel.userName)")
                        
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            
                            Text("Search")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }.padding()
                }
            }
    }
}

#Preview {
    SearchView()
}
