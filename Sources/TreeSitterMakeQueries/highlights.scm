; Makefiles, with the names of the theme's tokens (the upstream query used older ones: @conditional, @include, @repeat…).
(comment) @comment

["(" ")" "{" "}"] @punctuation.bracket
[":" "&:" "::" "|" ";" ","] @punctuation.delimiter
["$" "$$"] @punctuation.special

(automatic_variable) @variable.builtin

["=" ":=" "::=" "?=" "+=" "!="] @operator

[(text) (string) (raw_text)] @string

; Conditionals and loops.
["ifeq" "ifneq" "ifdef" "ifndef" "else" "endif" "if" "or" "and" "foreach"] @keyword

; Words that declare or change something.
["define" "endef" "vpath" "undefine" "export" "unexport" "override" "private"] @keyword.storage

["include" "sinclude" "-include"] @keyword.import

; Make's functions.
[
	"subst" "patsubst" "strip" "findstring" "filter" "filter-out" "sort" "word" "words" "wordlist" "firstword" "lastword"
	"dir" "notdir" "suffix" "basename" "addsuffix" "addprefix" "join" "wildcard" "realpath" "abspath" "call" "eval" "file"
	"value" "shell" "error" "warning" "info"
] @function

; A variable being set or used.
(variable_assignment name: (word) @variable)
(variable_reference (word) @variable)

; A rule's targets are what it defines.
(targets (word) @function)

; Make's own variables and targets.
(variable_assignment
  name: (word) @constant.builtin
  (#match? @constant.builtin "^(AR|AS|CC|CXX|CPP|FC|RM|ARFLAGS|ASFLAGS|CFLAGS|CXXFLAGS|CPPFLAGS|FFLAGS|LDFLAGS|LDLIBS|VPATH|MAKEFILE_LIST|MAKE_RESTARTS|\\.DEFAULT_GOAL|\\.RECIPEPREFIX|\\.EXTRA_PREREQS)$"))
(variable_reference
  (word) @constant.builtin
  (#match? @constant.builtin "^(AR|AS|CC|CXX|CPP|FC|RM|ARFLAGS|ASFLAGS|CFLAGS|CXXFLAGS|CPPFLAGS|FFLAGS|LDFLAGS|LDLIBS|VPATH|MAKEFILE_LIST|MAKE_RESTARTS|\\.DEFAULT_GOAL|\\.RECIPEPREFIX|\\.EXTRA_PREREQS)$"))
(targets
  (word) @constant.builtin
  (#match? @constant.builtin "^\\.(PHONY|SUFFIXES|DEFAULT|PRECIOUS|INTERMEDIATE|SECONDARY|SECONDEXPANSION|DELETE_ON_ERROR|IGNORE|LOW_RESOLUTION_TIME|SILENT|EXPORT_ALL_VARIABLES|NOTPARALLEL|ONESHELL|POSIX)$"))
