//
//  GeneratedViewModel.swift
//  ImageGenerator
//
//  Created by Prystupa Taras on 02.09.2024.
//

import Foundation

extension GeneratorView {
    class ViewModel: ObservableObject {
        @Published var duration = 0
        @Published var image: URL?
        
        let promt: String
        let selectedStyle: ImageStyle
        
        private let openAIService = OpenAIService()
        
        init( promt: String, selectedStyle: ImageStyle) {
            self.promt = promt
            self.selectedStyle = selectedStyle
        }
        
        func generateImage() {
            let formatedPromt = "\(selectedStyle.title) image of \(promt)"
            
            Task {
                do {
                    let generatedImage = try await openAIService.generateImage(prompt: formatedPromt)
                    guard let imageURLString = generatedImage.data.first?.url, let imageUrl = URL(string: imageURLString) else {
                        print("Failed generate image")
                        return
                    }
                    
                    await MainActor.run {
                        self.image = imageUrl
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
