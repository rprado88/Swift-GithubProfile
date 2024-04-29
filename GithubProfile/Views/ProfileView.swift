//
//  ProfileView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct ProfileView: View {
    
    var viewModel = ProfileViewViewModel()
    
    @State private var model: Profile?
    
    init(userName: String){
        
    }
    
    var body: some View {
        VStack(spacing:  20) {
            
            Spacer()
            
            Form{
                AsyncImage(url: URL(string: model?.avatarUrl ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                }
                .frame(width: 120, height: 120)
                
                Text(model?.name ?? "Name Placeholder")
                    .bold()
                    .font(.title3)
                
                Text(model?.login ?? "Login Placeholder")
                    .bold()
                    .font(.title3)
                
                Text(model?.bio ?? "Bio Placeholder")
                    .padding()
                
                Button {
                    // Action
                    print("Search View")
                    SearchView()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                        
                        Text("New Search")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }.padding()
            }
            Spacer()
        }
        .padding()
        .task {
            do {
                model = try await viewModel.getProfile(userName: "rprado88")
            } catch Errors.invalidURL {
                print("Invalid URL")
            }
            catch Errors.invalidResponse {
                print("Invalid response")
            }
            catch Errors.invalidData {
                print("Invalid data")
            }
            catch {
                print("Unexepected error")
            }
        }
    }
}

#Preview {
    ProfileView(userName: "rprado88")
}
