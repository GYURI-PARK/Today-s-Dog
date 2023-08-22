//
//  ContentView.swift
//  Today's Dog
//
//  Created by GYURI PARK on 2023/08/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = DogImageViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            
            
            TitleTextView(vm: vm)
            
            DogImageView(imageURL: vm.randomDogImage?.message ?? "")
            
            
            Button (action: {
                
                vm.getRandomImage()
            }) {
                Rectangle()
                    .frame(width: 340, height: 80)
                    .cornerRadius(50)
            }
        }
    }
}

struct TitleTextView: View {
    
    @StateObject var vm: DogImageViewModel
    
    var body: some View {
        Text("오늘의 강아지를 확인해보세요🐕")
    }
}

struct DogImageView: View {
    
    var imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 340, height: 500)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 5)
            case .failure:
                Text("이미지 준비 중")
            case .empty:
                
                ZStack {
                    Text("로딩 중 ...")
                    
                    Rectangle()
                        .frame(width: 340, height: 500)
                        .foregroundColor(.gray)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 5)
                }
            @unknown default:
                Text("이미지 준비 중")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
