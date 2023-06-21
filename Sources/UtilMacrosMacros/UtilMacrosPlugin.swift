//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 11/6/23.
//

import SwiftCompilerPlugin
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

@main
struct UtilMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        TodoMacro.self,
        URLMacro.self
    ]
}
