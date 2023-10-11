import SwiftUI

public struct GSSlider<T: View>: View  {
    @State private var selectedTab = SlideID()
    private var slideViews: [T] = []
    private var slidesId: [SlideID] = []
    private var config = GSSConfig()
    
    public init(slides: [T], config: GSSConfig = GSSConfig()) {
        self.slideViews = slides
        self.generateSlideIds()
        self.selectedTab = slidesId.first ?? SlideID()
        self.config = config
    }
    
   public var body: some View {
       ZStack{
           GeometryReader{ proxy in
               
               TabView(selection: $selectedTab) {
                   ForEach(Array(slideViews.enumerated()), id: \.offset){ index, view in
                       view.tag(slidesId[index])
                   }
               }
               .tabViewStyle(getPageStyle(style: config.pagingStyle))
               .onAppear(perform: {
                   setTheme()
                   if config.shouldAutoAnimate && slideViews.count > 1{
                       startAutoChangeTimer()
                   }
               })
               
               
           }
           
       }
    }
    
    private func startAutoChangeTimer() {
        Timer.scheduledTimer(withTimeInterval: config.autoAnimateDelay, repeats: true) { _ in
            selectedTab = slidesId[(getSlideIndex(key: selectedTab) + 1) % slideViews.count]
        }
    }
    private func getSlideIndex(key: SlideID)->Int {
      
        for index in 0..<slidesId.count {
            if slidesId[index] == key {
                return index
            }
        }
        return -1
    }
    
    private func getPageStyle(style: GSSPagingStyle) -> PageTabViewStyle {
        switch style {
        case .autoIndicator:
            return .page(indexDisplayMode: .automatic)
        case .alwaysIndicator:
            return .page(indexDisplayMode: .always)
        case .noIndicator:
            return .page(indexDisplayMode: .never)
        }
    }
    private func setTheme(){
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(config.primaryColor)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(config.secondaryColor)
        UIPageControl.appearance().tintColor = UIColor(config.secondaryColor)
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
