#!/bin/sh

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

# GITHUB
# NMSC
# VENDOR
# DDD
# SITE
# smth

cp -R Scripts/nuspecs/Net.nuspec NugetPackages/$NMSC.nuspec
sed -E -i "" "s/MNSC/$NMSC/" NugetPackages/$NMSC.nuspec
sed -E -i "" "s/GITHUB/$GITHUB/" NugetPackages/$NMSC.nuspec
sed -E -i "" "s/VENDOR/$VENDOR/" NugetPackages/$NMSC.nuspec
sed -E -i "" "s/DDD/$DDD/" NugetPackages/$NMSC.nuspec
sed -E -i "" "s/SITE/$SITE/" NugetPackages/$NMSC.nuspec
sed -E -i "" "s/smth/$smth/" NugetPackages/$NMSC.nuspec

cp -R Scripts/nuspecs/iOS.nuspec NugetPackages/$NMSC.iOS.nuspec
sed -E -i "" "s/MNSC/$NMSC/" NugetPackages/$NMSC.iOS.nuspec
sed -E -i "" "s/GITHUB/$GITHUB/" NugetPackages/$NMSC.iOS.nuspec
sed -E -i "" "s/VENDOR/$VENDOR/" NugetPackages/$NMSC.iOS.nuspec
sed -E -i "" "s/DDD/$DDD/" NugetPackages/$NMSC.iOS.nuspec
sed -E -i "" "s/SITE/$SITE/" NugetPackages/$NMSC.iOS.nuspec
sed -E -i "" "s/smth/$smth/" NugetPackages/$NMSC.iOS.nuspec

cp -R Scripts/nuspecs/Android.nuspec NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s/MNSC/$NMSC/" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s/GITHUB/$GITHUB/" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s/VENDOR/$VENDOR/" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s/DDD/$DDD/" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s/SITE/$SITE/" NugetPackages/$NMSC.Android.nuspec
sed -E -i "" "s/smth/$smth/" NugetPackages/$NMSC.Android.nuspec

cp -R Scripts/nuspecs/Mac.nuspec NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s/MNSC/$NMSC/" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s/GITHUB/$GITHUB/" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s/VENDOR/$VENDOR/" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s/DDD/$DDD/" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s/SITE/$SITE/" NugetPackages/$NMSC.Mac.nuspec
sed -E -i "" "s/smth/$smth/" NugetPackages/$NMSC.Mac.nuspec



# sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$IOSVERSION.7/" Bindings/Agora.Net.Voice.iOS/Agora.Net.Voice.iOS.csproj