//
//  SlideView.swift
//  montra
//
//  Created by Ali Raza on 19/10/2022.
//

import SwiftUI

struct SlideView: View {
    
    let slide: Slide
    
    var body: some View {
        VStack(spacing: 30){
            Image(self.slide.imageName)
                .frame(width: 200, height: 200)
                .padding(.bottom, 20)
            Text(self.slide.heading)
                .font(.custom("Inter", size: 32))
                .fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            Text(self.slide.text)
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
        }
        .padding(30)
    }
}

#if DEBUG
struct SlideView_Previews: PreviewProvider {
    
    static var previews: some View {
        SlideView(slide: Slide(imageName:"SlideImage-1", heading: "Gain total control of your money", text: "Setup your budget for each category so you in control"))
    }
}
#endif
