//
//  RouteRegistry.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import SwiftUI

@propertyWrapper
struct RouterOf<Route>: DynamicProperty {
    @ObservedObject private var router = RouterRegistry.shared.router(for: Route.self)
    
    var wrappedValue: Router<Route> { router }
    var projectedValue: ObservedObject<Router<Route>>.Wrapper { $router }
}

final class RouterRegistry {
    
    static let shared = RouterRegistry()
    
    func router<R>(for route: R.Type) -> Router<R> {
        let key = ObjectIdentifier(R.self)
        if storage[key] == nil {
            storage[key] = Router<R>()
        }
        return storage[key] as! Router<R>
    }
    
    private var storage = [AnyHashable: Any]()
}
