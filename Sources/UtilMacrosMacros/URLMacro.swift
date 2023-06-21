//
//  URLMacro.swift
//
//
//  Created by Jia Chen Yee on 21/6/23.
//

import SwiftCompilerPlugin
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

public struct URLMacro: ExpressionMacro {
    public static func expansion(of node: some FreestandingMacroExpansionSyntax,
                                 in context: some MacroExpansionContext) throws -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression,
              let segments = argument.as(StringLiteralExprSyntax.self)?.segments else {
            throw CustomError.message("Need a static string")
        }
        
        guard URL(string: segments.description) != nil else {
            throw CustomError.message("Invalid URL: \(segments.description)")
        }
        
        return "URL(string: \(argument))!"
    }
}
