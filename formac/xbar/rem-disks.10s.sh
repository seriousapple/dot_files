#!/bin/bash

volumes="$(df -h|awk '{print $NF}'|awk '/^\/Volume/')";

amount="$(df -h|awk '{print $NF}'|awk '/^\/Volume/'|wc -l|xargs)"

if [ -z "$volumes" ]
then
    echo "mnt/0"
else
    echo "mnt/$amount"
fi

echo "---"
echo "$volumes"

# Metadata allows your plugin to show up in the app, and website.
#
#  <xbar.title>Check for mounted drives</xbar.title>
#  <xbar.version>v1.0</xbar.version>
#  <xbar.author>serious_apple</xbar.author>
#  <xbar.author.github>seriousapple</xbar.author.github>
#  <xbar.desc>Checks if there's any removable drives and displays it's amount in menubar</xbar.desc>
#  <xbar.image>https://avatars.githubusercontent.com/u/24712602?v=4</xbar.image>
#  <xbar.dependencies>none</xbar.dependencies>
#  <xbar.abouturl>http://url-to-about.com/</xbar.abouturl>

