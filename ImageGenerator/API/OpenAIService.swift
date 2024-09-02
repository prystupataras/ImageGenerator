//
//  OpenAIService.swift
//  ImageGenerator
//
//  Created by Prystupa Taras on 02.09.2024.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endpoinURL = "https://api.openai.com/v1/images/generations"
    
    func generateImage(prompt: String) async throws -> OpenAIImageResponce {
        let body = OpenAIImageRequestBody(prompt: prompt, size: "512x512")
        let headers: HTTPHeaders = [
            "Autorization": "Bearer \(Constans.openAIAPIKey)"]
        
        return try await AF.request(endpoinURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIImageResponce.self).value
    }
}

struct OpenAIImageResponce: Decodable {
    let data: [OpenAIImageURL]
}

struct OpenAIImageURL: Decodable {
    let url: String
}

struct OpenAIImageRequestBody: Encodable {
    let prompt: String
    let size: String
}
