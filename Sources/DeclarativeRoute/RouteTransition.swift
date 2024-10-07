//
//  RouteTransition.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import SwiftUI

@MainActor public protocol RouteTransition {
    associatedtype Value
    associatedtype Body : View
    associatedtype Destination: View
    
    @ViewBuilder @MainActor func body(
        _ content: RouteModifier<Self>.Content,
        unwrapping value: Binding<Self.Value?>,
        @ViewBuilder destination: @escaping (Self.Value) -> Self.Destination
    ) -> Self.Body
}
