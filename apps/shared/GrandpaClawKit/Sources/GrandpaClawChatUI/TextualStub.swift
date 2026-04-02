// Stub for Textual markdown rendering - Swift 5.9 compatible
import SwiftUI

public struct StructuredText: View {
    public init(markdown: String) {}
    public var body: some View { Text("") }
}

public struct ChatMarkdownPreprocessor {
    public struct Processed {
        public let cleaned: String
    }
    public static func preprocess(markdown: String) -> Processed {
        Processed(cleaned: markdown)
    }
}

public struct ChatMarkdownStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
    }
}
