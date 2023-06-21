// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.

@freestanding(declaration)
public macro todo(_ value: String) = #externalMacro(module: "UtilMacrosMacros", type: "TodoMacro")

import Foundation

@freestanding(expression)
public macro url(_ value: String) -> URL = #externalMacro(module: "UtilMacrosMacros", type: "URLMacro")
