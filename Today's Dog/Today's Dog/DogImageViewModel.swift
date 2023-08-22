//
//  DogImageViewModel.swift
//  Today's Dog
//
//  Created by GYURI PARK on 2023/08/22.
//

import Foundation
import SwiftUI
import Combine

class DogImageViewModel: ObservableObject {
    @Published var randomDogImage: JsonModel?
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        getRandomImage()
    }
    
    func getRandomImage() {
        
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .tryMap { data -> Data in
                return data
            }
            .decode(type: JsonModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                completion in
                 print("Completion : ", completion)
            }, receiveValue: { [weak self] randomImage in
                self?.randomDogImage = randomImage
                
            })
            .store(in: &cancellables)
    }
    
}
