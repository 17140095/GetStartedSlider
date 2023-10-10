//
//  SlideViewModel.swift
//  montra
//
//  Created by Ali Raza on 19/10/2022.
//

import Foundation
import SwiftUI

struct SlideViewModel{
    var slides:[Slide] = [Slide]()
    
    init(){
        self.fetchSlides()
    }
    private mutating func fetchSlides(){
        let image1 = "SlideImage-1"
        let heading1 = "Gain total control of your money"
        let text1 = "Become your own money manager and make every cent count"
        
        let image2 = "SlideImage-2"
        let heading2 = "Know where your money goes"
        let text2 = "Track your transaction easily, with categories and financial report "
        
        let image3 = "SlideImage-3"
        let heading3 = "Planning ahead"
        let text3 = "Setup your budget for each category so you in control"
        
        
        self.slides.append(Slide(imageName: image1, heading: heading1, text: text1))
        self.slides.append(Slide(imageName: image2, heading: heading2, text: text2))
        self.slides.append(Slide(imageName: image3, heading: heading3, text: text3))
        
    }
    func getSlideViews() -> [AnyView] {
        var toReturn: [AnyView] = []
        
        for slide in slides {
            toReturn.append(AnyView(SlideView(slide: slide)))
        }
        
        return toReturn
    }

}

var slides:[Slide] = [
    Slide(imageName: "SlideImage-1", heading: "Gain total control of your money", text: "Become your own money manager and make every cent count"),
    Slide(imageName: "SlideImage-2", heading: "Know where your money goes", text: "Track your transaction easily, with categories and financial report "),
    Slide(imageName: "SlideImage-3", heading: "Planning ahead", text: "Setup your budget for each category so you in control")
]
