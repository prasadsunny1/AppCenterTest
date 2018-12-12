#!/usr/bin/env bash
#
# For Xamarin Android or iOS, change the version name located in AndroidManifest.xml and Info.plist.
# AN IMPORTANT THING: YOU NEED DECLARE VERSION_CODE ENVIRONMENT VARIABLE IN APP CENTER BUILD CONFIGURATION.
echo "AAAA"
# TODAY_BUILD_COUNT=0
if [ ! -n "$TODAY_BUILD_COUNT" ];
then
    echo "You need define the TODAY_BUILD_COUNT variable in App Center"
else
    echo "TODAY_BUILD_COUNT Is Availible : Run the Program"
    echo "TODAY_BUILD_COUNT"
    echo $TODAY_BUILD_COUNT
    DATESTAMP=$(date +"%Y%m%d")
    echo "DATESTAMP"
    echo $DATESTAMP
    TODAYBUILD=$((1))
    VERSION_CODE="$DATESTAMP.$TODAY_BUILD_COUNT"
    TODAY_BUILD_COUNT=$(($TODAY_BUILD_COUNT+1))
    echo "VERSION_CODE"
    echo $VERSION_CODE
    echo "APPCENTER_SOURCE_DIRECTORY"
    echo $APPCENTER_SOURCE_DIRECTORY
    ls $APPCENTER_SOURCE_DIRECTORY
    if [ ! -n "$VERSION_CODE" ]
    then
        echo "You need define the VERSION_CODE variable in App Center"
        exit
    fi
    INFO_PLIST_FILE=$APPCENTER_SOURCE_DIRECTORY/AppCenterTest/AppCenterTest.iOS/Info.plist
    echo "INFO_PLIST_FILE"
    echo $INFO_PLIST_FILE
    if [ -e "$INFO_PLIST_FILE" ]
    then
        echo "Updating version name to $VERSION_CODE in Info.plist"
        plutil -replace CFBundleShortVersionString -string $VERSION_CODE $INFO_PLIST_FILE
        echo "File content:"
        cat $INFO_PLIST_FILE
    fi
    echo "TODAY_BUILD_COUNT after alteration"
    echo $TODAY_BUILD_COUNT
fi
