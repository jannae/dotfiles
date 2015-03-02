#!/bin/bash

#========================================================================
#  FILE:  set_default_apps.sh
#  DESCRIPTION:  Changes default apps for extensions
#  AUTHOR:  Scott Granneman (RSG), scott@chainsawonatireswing.com
#  COMPANY:  Chainsaw on a Tire Swing (http://ChainsawOnATireSwing.com)
#  VERSION:  0.1
#  CREATED:  09/17/2012 21:44:01 CDT
#  REVISION:
#========================================================================

{ cat <<eof
com.mouapp.Mou:markdown
com.mouapp.Mou:md
com.mouapp.Mou:mdwn
com.sublimetext.3:css
com.sublimetext.3:scss
com.sublimetext.3:sass
com.sublimetext.3:java
com.sublimetext.3:js
com.sublimetext.3:mediawiki
com.sublimetext.3:mf
com.sublimetext.3:properties
com.sublimetext.3:sh
com.sublimetext.3:text
com.sublimetext.3:txt
com.sublimetext.3:xml
cx.c3.theunarchiver:gz
cx.c3.theunarchiver:gzip
cx.c3.theunarchiver:rar
cx.c3.theunarchiver:tar
cx.c3.theunarchiver:tgz
cx.c3.theunarchiver:zip
eof
} | grep . |
while IFS=$':' read bundle_id extension ; do
  # Grep to see if Bundle ID exists, sending stdout to /dev/null
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump | grep $bundle_id > /dev/null
  # Save exit status (0=success & 1=failure)
  status=$?
  # If exit status failed, notify me & exit; if not, change default app for extension
  if test $status -eq 1 ; then
    echo "$bundle_id doesn't exist! Fix the script!"
    exit
  else
    echo -e "\nChanging $extension so it opens with $bundle_id …\n"
    duti -s $bundle_id .$extension all
    echo -e "Here's proof…\n"
    duti -x $extension
    echo -e "\n----------"
  fi
done
