function today
    argparse --name today 'h/help' 'e/ext=?' 'd/delta=?' 'n/noop' -- $argv
    or return 1

    set format '+%Y-%m-%d'

    if test (count $_flag_help) -gt 0
        echo "Opens a file with today's date using vim"
        echo ''
        echo '-e/--ext=EXTENSION  default: md'
        echo '-d/--delta=DAYS     e.g. +1 (tomorrow), -1 (yesterday)'
        echo '-n/--noop           Only prints the file name'
        echo '-h/--help'
        echo ''
        echo 'Examples'
        echo "today                      # vim "(date $format)".md"
        echo "today -eadoc -d+1          # vim "(date -v +1d $format)".adoc"
        echo "today -ext=txt --delta=-1  # vim "(date -v -1d $format)".txt"
        echo "today -ext=txt --delta=-1  # vim "(date -v -1d $format)".txt"
        return 0
    end

    # Give ext a default value
    set ext $_flag_ext md
    set ext $ext[1]

    if test (count $_flag_delta) -gt 0
        set file_name (date -v "$_flag_delta"d $format).$ext
    else
        set file_name (date $format).$ext
    end

    vim $file_name
end
