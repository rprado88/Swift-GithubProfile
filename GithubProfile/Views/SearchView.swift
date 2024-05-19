//
//  SearchView.swift
//  GithubProfile
//
//  Created by Rodrigo Prado on 27/04/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewViewModel()
    
    var profileViewModel = ProfileViewViewModel()
    
    @State private var isTaskCompleted = false
    
    @State var model: Profile?
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HeaderView()
                
                Form{
                    TextField("User Name", text: $viewModel.userName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    Spacer()
                    
                    Button("Search"){
                        
                        Task{
                            do {
                                model = try await profileViewModel.getProfile(userName: viewModel.userName)
                                
                                print(model)
                                
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
                            
                            isTaskCompleted = true
                        }
                    }
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                }
                Spacer()
            }
            .navigationDestination(isPresented: $isTaskCompleted) {
                MainView(userProfile: model)
             }
        }
    }
}

#Preview {
    SearchView()
}
