//
//  SliderTest.swift
//  GetStartedSlider_Example
//
//  Created by Ali Raza on 10/10/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SwiftUI
import GetStartedSlider

struct SliderTest: View {
    var body: some View {
        GSSlider(slides: SlideViewModel().getSlideViews())
            .setIndicatorColors(primary: Color.red, secondary: Color.green)
            
    }
}

#Preview {
    SliderTest()
}
