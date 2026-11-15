import Runestone
import TreeSitterMake
import TreeSitterMakeQueries

public extension TreeSitterLanguage {
    static var make: TreeSitterLanguage {
        let highlightsQuery = TreeSitterLanguage.Query(contentsOf: TreeSitterMakeQueries.Query.highlightsFileURL)
        return TreeSitterLanguage(tree_sitter_make(), highlightsQuery: highlightsQuery)
    }
}
