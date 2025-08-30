import Foundation
import CoreServices

// Process each word from the command-line arguments.
guard CommandLine.arguments.count > 1 else {
    exit(0) // Exit silently if no arguments provided
}

for i in 1..<CommandLine.arguments.count {
    let wordToDefine = CommandLine.arguments[i]

    // Use Dictionary Services to get the definition.
    let definition = DCSCopyTextDefinition(nil, wordToDefine as CFString, CFRangeMake(0, wordToDefine.count))

    // Print the result if a definition is found.
    if let definitionString = definition?.takeRetainedValue() as? String {
        print("Definition for '\(wordToDefine)':\n")
        print(definitionString)
        if i < CommandLine.arguments.count - 1 {
            print("\n---") // Separator for multiple definitions
        }
    }
}
