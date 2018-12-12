#!/usr/bin/env bash
#
# For Xamarin Android or iOS, change the version name located in AndroidManifest.xml and Info.plist. 
# AN IMPORTANT THING: YOU NEED DECLARE VERSION_CODE ENVIRONMENT VARIABLE IN APP CENTER BUILD CONFIGURATION.
echo "AAAA"
DATESTAMP=$(date +"%Y%m%d")
echo "DATESTAMP"
echo $DATESTAMP
TODAYBUILD=$((1))
VERSION_CODE=$DATESTAMP
echo "LASTBUILD"
echo $LASTBUILD
echo "VERSION_CODE"
echo $VERSION_CODE
echo "TODAYBUILD"
echo $TODAYBUILD
# echo "TODAYBUILD PLUS ONE"
# let "TODAYBUILD+=1"
# echo $TODAYBUILD
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
