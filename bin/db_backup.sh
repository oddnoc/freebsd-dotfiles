#! /bin/sh

# Create daily, weekly, monthly database dumps.
# Save them directly to the backup server over ssh.

MYSQLDUMP='/usr/local/bin/mysqldump'
SSH='/usr/bin/ssh'
BZIP='/usr/bin/bzip2'
BASENAME='all_databases'
REMOTE_HOST='backup'

# Set up variables for the archive filename.
DOW=$(date +%a)
HOST=$(hostname -s)
day_num=$(date +%d)
week=$(expr $day_num / 7)
month_num=$(date +%m)

# Create archive filename.
if [ $day_num == 1 ]; then
	archive_file="$BASENAME-m$month_num.sql.bz2"
elif [ $DOW == "Sun" ]; then
	archive_file="$BASENAME-w$week.sql.bz2"
else 
	archive_file="$BASENAME-d$day_num.sql.bz2"
fi

$MYSQLDUMP --all-databases --events --ignore-table=mysql.event |  $SSH $REMOTE_HOST "$BZIP > $HOST/$archive_file"
