//
//  SimpleMiddleware.swift
//  RealWorldReSwift
//
//  Created by Tobias Ottenweller on 01.04.18.
//  Copyright © 2018 Tobias Ottenweller. All rights reserved.
//

import ReSwift

/**
 Examples:
 ```
 func logMiddleware(action: Action, context: MiddlewareContext<AppState>) -> Action? {

 print(action)
 return action
 }
 ```
 ```
 func asyncMiddleware(action: Action, context: MiddlewareContext<AppState>) -> Action? {

 DispatchQueue.main.async {
 context.next(action)
 }
 return nil
 }
 ```
 */
typealias SimpleMiddleware<State: StateType> = (Action, MiddlewareContext<State>) -> Action?

struct MiddlewareContext<State: StateType> {

    /// Closure that can be used to emit additional actions
    let dispatch: DispatchFunction
    let getState: () -> State?

    /// Closure that can be used forward your action if an async operation is performed.
    /// Just return `nil` in your middleware function in that case.
    let next: DispatchFunction

    var state: State? {
        return getState()
    }
}
