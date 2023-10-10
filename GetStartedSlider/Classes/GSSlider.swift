import SwiftUI

public struct GSSlider<T: View>: View  {
    @State private var selectedTab = SlideID()
    @State private var pageTabViewStyle = PageTabViewStyle(indexDisplayMode: .automatic)
    private var slideViews: [T] = []
    private var slidesId: [SlideID] = []
    
    public init(slides: [T]) {
        self.slideViews = slides
        self.generateSlideIds()
        self.selectedTab = slidesId[0]
        self.setTheme()
    }
    
   public var body: some View {
       ZStack{
           GeometryReader{ proxy in
               
               TabView(selection: $selectedTab) {
                   ForEach(Array(slideViews.enumerated()), id: \.offset){ index, view in
                       view.tag(slidesId[index])
                   }
               }
               .tabViewStyle(pageTabViewStyle)
               
               
           }
           
       }
    }
    public func setIndicatorColors(primary: Color, secondary: Color) -> Self {
        setTheme(pColor: primary, sColor: secondary)
        return self
    }
    
    private func setTheme(pColor: Color = Color.black, sColor: Color = Color.gray){
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(pColor)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(sColor)
        UIPageControl.appearance().tintColor = UIColor(sColor)
    }
    private mutating func generateSlideIds() {
        self.slidesId = []
        for _ in 0..<self.slideViews.count {
            slidesId.append(SlideID())
        }
    }
}

private struct SlideID: Identifiable, Hashable {
    let id = UUID().uuidString
}
