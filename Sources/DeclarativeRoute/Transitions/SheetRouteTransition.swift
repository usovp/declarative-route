//
//  SheetRouteTransition.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 07.10.2024.
//

import SwiftUI
import SwiftUINavigation

@MainActor public struct SheetRouteTransition<Route, Value, Destination: View>: RouteTransition {
    let onDismiss: (() -> Void)?
    public func body(
        _ content: RouteModifier<Self>.Content,
        unwrapping value: Binding<Value?>,
        @ViewBuilder destination: @escaping (Value) -> Destination
    ) -> some View {
        content
            .sheet(unwrapping: value, onDismiss: onDismiss) { $value in
                destination(value)
            }
    }
}
