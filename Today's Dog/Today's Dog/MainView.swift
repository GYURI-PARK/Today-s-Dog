//
//  ContentView.swift
//  Today's Dog
//
//  Created by GYURI PARK on 2023/08/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = DogImageViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            
            Spacer()
            
            TitleTextView(vm: vm)
            
            DogImageView(imageURL: vm.randomDogImage?.message ?? "")
            
            Button (action: {
                
                vm.getRandomImage()
            }) {
                ZStack{
                    Rectangle()
                        .frame(width: 340, height: 60)
                        .cornerRadius(50)
                        .foregroundColor(.black)
                    
                    Text("Click ! ")
                        .foregroundColor(.white)
                }
            
            }
        }
    }
}

struct TitleTextView: View {
    
    @StateObject var vm: DogImageViewModel
    
    var body: some View {
        
        LinearGradient(
            colors: [.red, .blue, .green, .yellow],
            startPoint: .leading,
            endPoint: .trailing
        )
        .mask(
            Text("RANDOM DOG")
                .font(Font.system(size: 45, weight: .black))
        )
    }
}
