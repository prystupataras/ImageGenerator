//
//  PromptView.swift
//  ImageGenerator
//
//  Created by Prystupa Taras on 02.09.2024.
//

import SwiftUI

struct PromptView: View {
    
    @State var selectedStyle = ImageStyle.allCases[0]
    @State var promptText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Generate")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
                Text("Choose a style")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                GeometryReader { reader in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(ImageStyle.allCases, id: \.self) { imageStyle in
                                Button(action: {
                                    selectedStyle = imageStyle
                                }, label: {
                                    Image(imageStyle.rawValue)
                                        .resizable()
                                        .background(Color.blue)
                                        .scaledToFill()
                                        .frame(width: reader.size.width * 0.4, height: reader.size.width * 0.4 * 1.4)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.yellow, lineWidth: imageStyle == selectedStyle ? 3 : 0)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                })
                            }
                        }
                    }
                }
                Text("Enter a promt")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                TextEditor(text: $promptText)
                    .scrollContentBackground(.hidden)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .foregroundStyle(.white)
                    .tint(.yellow)
                
                VStack(alignment: .center) {
                    NavigationLink {
                        GeneratorView(viewModel: .init(promt: promptText, selectedStyle: selectedStyle))
                    } label: {
                        Text("Generate")
                            .foregroundStyle(.black)
                            .padding()
                            .background(.yellow)
                            .clipShape(Capsule())
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            .padding()
            .background(Color.black
                .edgesIgnoringSafeArea(.all))
        }
    }
}

#Preview {
    PromptView()
}
