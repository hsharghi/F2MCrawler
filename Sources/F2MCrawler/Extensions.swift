import Foundation


extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    
    func isMatch(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
    
    func findMatches(in string: String) -> [String] {
        let range = NSRange(location: 0, length: string.utf16.count)
        let rangeMatches = matches(in: string, options: [], range: range)
    
        let allMatches = rangeMatches.map { match in
            return (string as NSString).substring(with: match.range)
        }
        
        return allMatches
    }
    
    
    
}


