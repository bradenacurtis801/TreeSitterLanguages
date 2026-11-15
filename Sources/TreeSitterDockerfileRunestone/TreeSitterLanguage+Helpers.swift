import Runestone
import TreeSitterDockerfile
import TreeSitterDockerfileQueries

public extension TreeSitterLanguage {
    static var dockerfile: TreeSitterLanguage {
        let highlightsQuery = TreeSitterLanguage.Query(contentsOf: TreeSitterDockerfileQueries.Query.highlightsFileURL)
        return TreeSitterLanguage(tree_sitter_dockerfile(), highlightsQuery: highlightsQuery)
    }
}
