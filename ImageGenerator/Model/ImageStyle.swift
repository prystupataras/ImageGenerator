//
//  ImageStyle.swift
//  ImageGenerator
//
//  Created by Prystupa Taras on 02.09.2024.
//

import Foundation

enum ImageStyle: String, CaseIterable {
    case surrealism
    case realism
    case threeDRender
    case minimalism
    case abstract
    case retro
    case geometric
    
    var title: String {
        switch self {
        case .surrealism:
            return "Surrealism"
        case .realism:
            return "Realism"
        case .threeDRender:
            return "3D Render"
        case .minimalism:
            return "Minimalism"
        case .abstract:
            return "Abstract"
        case .retro:
            return "Retro"
        case .geometric:
            return "Geometric"
        }
    }
    
}
