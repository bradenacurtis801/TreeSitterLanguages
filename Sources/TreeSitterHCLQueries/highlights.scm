; HCL (Terraform, Packer, Nomad…). The grammar ships no highlight query: this one names what a theme colors apart.
(comment) @comment

; A block's first word (`resource`, `variable`, `data`, `module`, `dynamic`…) and its labels.
(block . (identifier) @keyword.storage)
(block (string_lit) @string)

(attribute (identifier) @property)
(object_elem key: (expression (variable_expr (identifier) @property.key)))

(function_call (identifier) @function)

(variable_expr (identifier) @variable)
(get_attr (identifier) @property)

(literal_value (bool_lit) @constant.builtin)
(literal_value (null_lit) @constant.builtin)
(numeric_lit) @number

(string_lit) @string
(template_literal) @string
(heredoc_template) @string

(template_interpolation_start) @punctuation.special
(template_interpolation_end) @punctuation.special
(template_directive_start) @punctuation.special
(template_directive_end) @punctuation.special

["if" "else" "endif" "for" "endfor" "in"] @keyword

["!" "*" "/" "%" "+" "-" "<" ">" "==" "!=" "<=" ">=" "&&" "||" "?" ":" "=>"] @operator
["[" "]" "(" ")"] @punctuation.bracket
["," "."] @punctuation.delimiter
