import SwiftCompilerPlugin
import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

public struct TodoMacro: DeclarationMacro {
    public static func expansion(of node: some FreestandingMacroExpansionSyntax,
                                 in context: some MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        
        guard let argument = node.argumentList.first?.expression,
              let segments = argument.as(StringLiteralExprSyntax.self)?.segments else {
            throw CustomError.message("Need a static string")
        }
        
#if DEBUG
        let severity = DiagnosticSeverity.warning
#else
        let severity = DiagnosticSeverity.error
#endif
        context.diagnose(Diagnostic(node: node._syntaxNode,
                                    message: Message(message: "TODO: \(segments.description)",
                                                     diagnosticID: .init(domain: "todo", id: "UUID().uuidString"),
                                                     severity: severity), highlights: [node._syntaxNode])
        )
        
        
        return []
    }
}

struct Message: DiagnosticMessage {
    var message: String
    
    var diagnosticID: SwiftDiagnostics.MessageID
    
    var severity: SwiftDiagnostics.DiagnosticSeverity
}

enum CustomError: Error, CustomStringConvertible {
    case message(String)
    
    var description: String {
        switch self {
        case .message(let string):
            return string
        }
    }
}
