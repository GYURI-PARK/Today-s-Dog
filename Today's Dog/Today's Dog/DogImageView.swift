//
//  DogImageView.swift
//  Today's Dog
//
//  Created by GYURI PARK on 2023/08/23.
//

import SwiftUI

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
