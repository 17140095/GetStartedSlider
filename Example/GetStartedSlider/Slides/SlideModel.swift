//
//  SlideModel.swift
//  montra
//
//  Created by Ali Raza on 19/10/2022.
//

import Foundation
import SwiftUI

struct Slide: Identifiable, Hashable{
    let id = UUID().uuidString
    let imageName: String
    let heading: String
    let text: String
}
