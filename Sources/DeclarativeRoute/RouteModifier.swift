//
//  IdeaRouter.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import SwiftUI
import CasePaths
import SwiftUINavigation

extension View {
    public func onRoute<Route, Transition: RouteTransition>(
        _ route: CasePath<Route, Transition.Value>,
        transition: Transition,
        @ViewBuilder destination: @escaping (Transition.Value) -> Transition.Destination
    ) -> some View {
        modifier(CaseRouteModifier(case: route, transition: transition, destination: destination))
    }
}

private struct CaseRouteModifier<Route, Transition: RouteTransition>: ViewModifier {
    @RouterOf<Route> private var router
    let `case`: CasePath<Route, Transition.Value>
    let transition: Transition
    @ViewBuilder let destination: (Transition.Value) -> Transition.Destination
    func body(content: Content) -> some View {
        content
            .modifier(
                RouteModifier(
                    value: $router.route.case(self.case),
                    transition: transition,
                    destination: destination
                )
            )
    }
}

public struct RouteModifier<Transition: RouteTransition>: ViewModifier {
    @Binding var value: Transition.Value?
    let transition: Transition
    @ViewBuilder let destination: (Transition.Value) -> Transition.Destination
    
    @ViewBuilder public func body(content: Content) -> some View {
        transition
            .body(content, unwrapping: $value, destination: destination)
    }
}
