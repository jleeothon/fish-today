set ext_args '(printf md\tmarkdown\nadoc\tasciidoc\ntxt\tplain text\n)'
complete -c today -s e -l ext --no-files --require-parameter --keep-order -a $ext_args -d 'Extension'

set delta_args '(printf -- -1\tyesterday\n+1\ttomorrow\n)'
complete -c today -s d -l delta --no-files --require-parameter --keep-order -a $delta_args -d 'Change date'

complete -c today -s n -l noop --no-files -d 'Only print the file name'
complete -c today -s h -l help --no-files -d 'Help'
