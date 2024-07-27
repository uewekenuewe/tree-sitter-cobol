package tree_sitter_COBOL_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/tree-sitter/tree-sitter-COBOL"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_COBOL.Language())
	if language == nil {
		t.Errorf("Error loading Cobol grammar")
	}
}
