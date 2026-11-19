import Runestone
import TreeSitterINI
import TreeSitterINIQueries

public extension TreeSitterLanguage {
    static var ini: TreeSitterLanguage {
        let highlightsQuery = TreeSitterLanguage.Query(contentsOf: TreeSitterINIQueries.Query.highlightsFileURL)
        return TreeSitterLanguage(tree_sitter_ini(), highlightsQuery: highlightsQuery)
    }
}
