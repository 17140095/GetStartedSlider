//
//  SlideScreen.swift
//  montra
//
//  Created by Ali Raza on 19/10/2022.
//

import SwiftUI
//
//struct SlideScreen: View {
//    
//    @State var selectedTab: Slide = slides[0]
//    
//    init(){
//        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Themes.primaryColor)
//        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Themes.secondaryColor)
//        UIPageControl.appearance().tintColor = UIColor(Themes.secondaryColor)
//    }
//    
//    var body: some View {
//        ZStack{
//            GeometryReader{ proxy in
//                let frame = proxy.frame(in: .global)
//                
//                TabView(selection: $selectedTab) {
//                    ForEach(slides){ slide in
//                        
//                        SlideView(slide: slide)
//                            .frame(width: frame.width, height: frame.height)
//                            .tag(slide)
//                    }
//                }
//                .tabViewStyle(.page(indexDisplayMode: .always))
//                
//            }
//            
//        }
//    }
//}

#if DEBUG
struct SlideScreen_Previews: PreviewProvider {
    static var previews: some View {
        SlideScreen()
    }
}
#endif
