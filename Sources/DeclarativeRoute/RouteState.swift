//
//  RouteState.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import SwiftUI

@propertyWrapper
public struct RouteState<Route>: DynamicProperty {
    @RouterOf<Route> private var router
    
    public var wrappedValue: Route? {
        get { return router.route }
        nonmutating set { router.route = newValue }
    }
    
    public var projectedValue: Binding<Route?> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
    
    public init() { }
}
