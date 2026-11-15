; The words that begin an instruction, and the AS of a stage.
[
	"FROM" "AS" "RUN" "CMD" "LABEL" "EXPOSE" "ENV" "ADD" "COPY" "ENTRYPOINT" "VOLUME" "USER" "WORKDIR"
	"ARG" "ONBUILD" "STOPSIGNAL" "HEALTHCHECK" "SHELL" "MAINTAINER" "CROSS_BUILD"
] @keyword.storage

[
	(heredoc_marker)
	(heredoc_end)
] @keyword

(comment) @comment

; Images: the name, the tag or digest, the stage's alias.
(image_name) @type
(image_alias) @type
(image_tag) @string.special
(image_digest) @string.special
(image_spec
	(image_tag
		":" @punctuation.special)
	(image_digest
		"@" @punctuation.special))

; Flags like --from=base or --chown=1:1, and ports.
(param) @attribute
(expose_port) @number

; Names being set: ENV, ARG and LABEL.
(env_pair name: (unquoted_string) @property)
(label_pair key: (unquoted_string) @property)
(arg_instruction name: (unquoted_string) @property)

[
	(double_quoted_string)
	(single_quoted_string)
	(json_string)
	(heredoc_line)
] @string

; $NAME and ${NAME}.
(expansion
	[
		"$"
		"{"
		"}"
	] @punctuation.special)
(variable) @variable

(line_continuation) @punctuation.special
