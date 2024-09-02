//
//  GeneratorView.swift
//  ImageGenerator
//
//  Created by Prystupa Taras on 02.09.2024.
//

import SwiftUI
import Alamofire

struct GeneratorView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Generated Image")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            VStack {
                Text("Time spend: \("")")
                AsyncImage(url: viewModel.image) { image in
                    image.resizable().aspectRatio(1, contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .background(Color.gray.opacity(0.2))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
                .clipped()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.generateImage()
        }
    }
}

#Preview {
    GeneratorView(viewModel: .init(promt: "red car", selectedStyle: .threeDRender))
}
