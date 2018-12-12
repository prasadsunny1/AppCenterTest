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
    ANDROID_MANIFEST_FILE=$APPCENTER_SOURCE_DIRECTORY/AppCenterTest/AppCenterTest.Android/Properties/AndroidManifest.xml
    echo "ANDROID_MANIFEST_FILE"
    echo $ANDROID_MANIFEST_FILE
    if [ -e "$ANDROID_MANIFEST_FILE" ]
    then
        echo "Updating version name to $VERSION_CODE in AndroidManifest.xml"
        sed -i '' 's/versionCode="[0-9.]*"/versionCode="'$VERSION_CODE'"/' $ANDROID_MANIFEST_FILE
        echo "File content:"
        cat $ANDROID_MANIFEST_FILE
        echo "ANDROID_MANIFEST_FILE"
        echo $ANDROID_MANIFEST_FILE
    fi
    echo "TODAY_BUILD_COUNT after alteration"
    echo $TODAY_BUILD_COUNT
fi
