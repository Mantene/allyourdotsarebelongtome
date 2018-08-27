#! /bin/bash
USER=mhood@princeton.edu
PASSWD="sscfblzwfguqqqwu"	
COUNT=$( ~/bin/gmail-feed -u $USER -p $PASSWD -c )
COLOR_SET="#[fg=white bg=blue bold]"
COLOR_RESTORE="#[fg=$BYOBU_LIGHT bg=$BYOBU_DARK]"

if [ $COUNT -eq 0 ]; then
    echo "$COLOR_SET""No mail""$COLOR_RESTORE"
elif [ $COUNT -eq 1 ]; then
    echo "$COLOR_SET""1 mail""$COLOR_RESTORE"
else
    echo "$COLOR_SET""$COUNT mails""$COLOR_RESTORE"
fi  
