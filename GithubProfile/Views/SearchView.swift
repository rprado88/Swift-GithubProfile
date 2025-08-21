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
                Form {
                    
                    TextField("User Name", text: $viewModel.userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    Button("Search"){
                        
                        Task{
                            do {
                                model = await profileViewModel.getProfile(userName: viewModel.userName)
                                
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
                    .frame(width: 180, height: 50)
                    .frame(maxWidth: .infinity) 
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                .frame(width: 380)
                
                Spacer()
            }
            .navigationDestination(isPresented: $isTaskCompleted) {
                MainView(userProfile: model)
             }
        }
    }
}
