#!/bin/bash

set -eu -o pipefail

#date_cmd=date

# on os x, we have to explicitly use GNU date to get nanosecond support
date_cmd=gdate

gcc hello.c

start_ms=$( $date_cmd '+%s%3N' )

n=100

for i in $( seq 1 $n )
do
    ./a.out >/dev/null
done

end_ms=$( $date_cmd '+%s%3N' )
elapsed_ms=$(( $end_ms - $start_ms ))

echo $(( $elapsed_ms / $n ))ms per C process

rm -f a.out
