//
//  NavigateTransition.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import CasePaths
import SwiftUI
import SwiftUINavigation

public struct NavigateTransition<Value, Destination: View>: RouteTransition {
    
    public func body(
        _ content: RouteModifier<Self>.Content,
        unwrapping value: Binding<Value?>,
        @ViewBuilder destination: @escaping (Value) -> Destination
    ) -> some View {
        if #available(iOS 16, *, macOS 13, tvOS 16, watchOS 9, *) {
            content
                .navigationDestination(unwrapping: value) { $value in
                    destination(value)
                }
        } else {
            content
                .background(
                    NavigationLink(
                        unwrapping: value,
                        onNavigate: { isActive in onNavigate?(isActive) },
                        destination: { $route in destination(route) },
                        label: { Color.clear }
                    )
                )
        }
    }
    
    @available(iOS, introduced: 13, deprecated: 16)
    @available(macOS, introduced: 10.15, deprecated: 13)
    @available(tvOS, introduced: 13, deprecated: 16)
    @available(watchOS, introduced: 6, deprecated: 9)
    public init(onNavigate: ((Bool) -> Void)? = nil) {
        self.onNavigate = onNavigate
    }
    
    @available(iOS, introduced: 16, deprecated: 9999)
    @available(macOS, introduced: 13, deprecated: 9999)
    @available(tvOS, introduced: 16, deprecated: 9999)
    @available(watchOS, introduced: 9, deprecated: 9999)
    public init() {
        onNavigate = nil
    }
    
    private let onNavigate: ((Bool) -> Void)?
}


