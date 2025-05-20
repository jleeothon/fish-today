#!/usr/bin/env fish
set today_source (dirname (status -f))/../functions/today.fish
source $today_source

set date_yesterday (date -v '-1d' '+%Y-%m-%d')
set date_today (date '+%Y-%m-%d')
set date_tomorrow (date -v '+1d' '+%Y-%m-%d')

function check -a expected actual
    test $expected = $actual
    or echo "Expected '$expected' but got '$actual'" && return 1
end

check $date_today.adoc (today -eadoc --noop)
or exit 1

check $date_yesterday.md (today -d-1 --noop)
or exit 1

check $date_tomorrow.txt (today --ext=txt --delta=+1 --noop)
or exit 1

echo 'Success!'
