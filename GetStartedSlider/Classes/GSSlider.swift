import SwiftUI

public struct GSSlider<T: View>: View  {
    @State private var selectedTab = SlideID()
    private var slideViews: [T] = []
    private var slidesId: [SlideID] = []
    
    private var primaryColor: Color = .primary
    private var secondaryColor: Color = .secondary
    private var pagingStyle: GSSPagingStyle = .autoIndicator
    private var shouldAutoAnimate: Bool = false
    private var autoAnimateDelay: CGFloat = 2.0
    
    private var onButtonPress: (() -> Void)?
    private var doneButtonTitle: String = "Done"
    
    public init(slides: [T]) {
        self.slideViews = slides
        self.generateSlideIds()
        self.selectedTab = slidesId.first ?? SlideID()
    }
    
   public var body: some View {
       ZStack{
           GeometryReader{ proxy in
               
               TabView(selection: $selectedTab) {
                   ForEach(Array(slideViews.enumerated()), id: \.offset){ index, view in
                       view.tag(slidesId[index])
                   }
               }
               .tabViewStyle(getPageStyle(style: pagingStyle))
               .onAppear(perform: {
                   setTheme()
                   if shouldAutoAnimate && slideViews.count > 1{
                       startAutoChangeTimer()
                   }
               })
               .overlay {
                   if getSlideIndex(key: selectedTab) + 1 == slideViews.count {
                       VStack {
                            Spacer()
                            HStack{
                                 Spacer()
                                 Button {
                                      // Action for Get Started button
                                     onButtonPress?()
                                 } label: {
                                      Text(doneButtonTitle)
                                        .foregroundColor(secondaryColor)
                                        .fontWeight(.bold)
                                        .padding(20)
                                        .background(primaryColor)
                                        .cornerRadius(10)
                                 }
                                 .clipShape(.circle)
                                 
                                 
                            }
                            .padding(.bottom, 20)
                       }
                   }
               }
               
               
           }
           
       }
    }
    
    private func startAutoChangeTimer() {
        Timer.scheduledTimer(withTimeInterval: autoAnimateDelay, repeats: true) { _ in
            if getSlideIndex(key: selectedTab) + 1 == slideViews.count {
                return
            } else {
                selectedTab = slidesId[(getSlideIndex(key: selectedTab) + 1) % slideViews.count]
            }
            
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
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(primaryColor)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(secondaryColor)
        UIPageControl.appearance().tintColor = UIColor(secondaryColor)
    }
    private mutating func generateSlideIds() {
        self.slidesId = []
        for _ in 0..<self.slideViews.count {
            slidesId.append(SlideID())
        }
    }
    
    // Setters
    public func setPrimaryColor(color: Color) -> Self {
        var copy = self
        copy.primaryColor = color
        return copy
    }
    public func setSecondaryColor(color: Color) -> Self {
        var copy = self
        copy.secondaryColor = color
        return copy
    }
    public func setPagingStyle(style: GSSPagingStyle) -> Self {
        var copy = self
        copy.pagingStyle = style
        return copy
    }
    public func setAutoAnimate(shouldAutoAnimate: Bool = true, autoAnimateDelay: CGFloat = 2.0) -> Self {
        var copy = self
        copy.shouldAutoAnimate = shouldAutoAnimate
        copy.autoAnimateDelay = autoAnimateDelay
        return copy
    }
    public func onDoneButtonPress(action: @escaping () -> Void) -> Self {
        var copy = self
        copy.onButtonPress = action
        return copy
    }
    public func setDoneButtonTitle(title: String) -> Self {
        var copy = self
        copy.doneButtonTitle = title
        return copy
    }
}

private struct SlideID: Identifiable, Hashable {
    let id = UUID().uuidString
}
public enum GSSPagingStyle {
    case noIndicator
    case autoIndicator
    case alwaysIndicator
}
