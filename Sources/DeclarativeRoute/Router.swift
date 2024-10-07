//
//  Router.swift
//  DeclarativeRoute
//
//  Created by Pavel Usov on 06.10.2024.
//

import SwiftUI

class Router<Route>: ObservableObject {
    @Published var route: Route?
}
