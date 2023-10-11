//
//  GSSConfig.swift
//  Pods
//
//  Created by Ali Raza on 11/10/2023.
//

import SwiftUI

public struct GSSConfig {
    public var primaryColor: Color = .primary
    public var secondaryColor: Color = .secondary
    public var pagingStyle: GSSPagingStyle = .autoIndicator
    public var shouldAutoAnimate: Bool = false
    public var autoAnimateDelay: CGFloat = 2.0
    
    public init(
        primaryColor: Color = .primary,
        secondaryColor: Color = .secondary,
        pagingStyle: GSSPagingStyle = .autoIndicator,
        shouldAutoAnimate: Bool = false,
        autoAnimateDelay: CGFloat = 2.0
    ){
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.pagingStyle = pagingStyle
        self.shouldAutoAnimate = shouldAutoAnimate
        self.autoAnimateDelay = autoAnimateDelay
        
    }
}

public enum GSSPagingStyle {
    case noIndicator
    case autoIndicator
    case alwaysIndicator
}
