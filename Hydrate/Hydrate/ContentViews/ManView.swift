//
//  ManView.swift
//  Hydrate
//
//  Created by Justin Koster on 2023/08/09.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct ManView: View {
    @AppStorage("isOnboardingFinished") var isOnboardingFinished: Bool = false
    
    @EnvironmentObject var userVM: UserViewModel
    
    @ObservedObject var manager: HealthKit = HealthKit()
    
    @State private var action: Int? = 0
    @State private var WelcomeText = false
    
    var body: some View {
        ZStack(alignment: .top) {
            CustomColor.Background
                .ignoresSafeArea()
            
            VStack{
                HStack {
                    VStack{
                        Text("Welcome back!")
                            .font(.system(size: 20))
                            .padding(10)
                        
                        Text("Remember to let us know that you drank some water, while your at it take a look at your steps and calories burnt")
                            .font(.system(size: 10))
                            .frame(width: 125)
                            .padding(10)
                    }
                    
                    Image("Yoga")
                        .resizable()
                }
                .frame(width: 335, height: 250)
                .background(CustomColor.Secondary)
                .cornerRadius(25)
                
                HStack{
                    Text("Todays Stats")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    NavigationLink {
                        TodaysDetailsView()
                    } label: {
                        Text("See all")
                            .fontWeight(.bold)
                    }
                    
                }
                .padding()
                
                HStack{
                    VStack{
                        Image(systemName: "flame")
                            .foregroundColor(.black)
                            .font(.system(size: 40))
                            .frame(alignment: .leading)
                            .padding()
                        
                        Text("Todays Steps")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
                        Text(String(userVM.userData?.steps ?? 0))
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                    }
                    .frame(width: 165, height: 225)
                    .background(.white)
                    .cornerRadius(15)
                    
                    Spacer()
                    
                    VStack{
                        Image(systemName: "flame")
                            .foregroundColor(.black)
                            .font(.system(size: 40))
                            .frame(alignment: .leading)
                            .padding()
                        
                        Text("Calories Burnt")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
                        
                        Text("2000")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                        
                    }
                    .frame(width: 165, height: 225, alignment: .center)
                    .background(.white)
                    .cornerRadius(15)
                    
                }
                .padding()
            }
        }
        .navigationTitle("Activity")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Image(systemName: "gear")
                    .font(.headline)
            }
        }
        .onAppear {
            userVM.getUserDetails()
        }
    }
}
