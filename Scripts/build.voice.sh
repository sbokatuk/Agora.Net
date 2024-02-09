#!/bin/sh

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

if [ -z "$VERSION" ]
then
echo "No target Argument for nuget version"
else
echo "$IOSVERSION" > Bindings/Agora.Net.Voice.iOS/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$IOSVERSION.7/" Bindings/Agora.Net.Voice.iOS/Agora.Net.Voice.iOS.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-ios/<TargetFramework>net7.0-ios/" Bindings/Agora.Net.Voice.iOS/Agora.Net.Voice.iOS.csproj
dotnet pack Bindings/Agora.Net.Voice.iOS/Agora.Net.Voice.iOS.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$IOSVERSION.8/" Bindings/Agora.Net.Voice.iOS/Agora.Net.Voice.iOS.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-ios/<TargetFramework>net8.0-ios/" Bindings/Agora.Net.Voice.iOS/Agora.Net.Voice.iOS.csproj
dotnet pack Bindings/Agora.Net.Voice.iOS/Agora.Net.Voice.iOS.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf voiceios
unzip -n -q Net.Agora.Voice.iOS.$IOSVERSION.7.nupkg -d voiceios
unzip -n -q Net.Agora.Voice.iOS.$IOSVERSION.8.nupkg -d voiceios
rm Net.Agora.Voice.iOS.$IOSVERSION.7.nupkg
rm Net.Agora.Voice.iOS.$IOSVERSION.8.nupkg
cd ..
echo "ios part nugets generated"
echo "$MACVERSION" > Bindings/Agora.Net.Voice.Mac/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$MACVERSION.7/" Bindings/Agora.Net.Voice.Mac/Agora.Net.Voice.Mac.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-maccatalyst/<TargetFramework>net7.0-maccatalyst/" Bindings/Agora.Net.Voice.Mac/Agora.Net.Voice.Mac.csproj
dotnet pack Bindings/Agora.Net.Voice.Mac/Agora.Net.Voice.Mac.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$MACVERSION.8/" Bindings/Agora.Net.Voice.Mac/Agora.Net.Voice.Mac.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-maccatalyst/<TargetFramework>net8.0-maccatalyst/" Bindings/Agora.Net.Voice.Mac/Agora.Net.Voice.Mac.csproj
dotnet pack Bindings/Agora.Net.Voice.Mac/Agora.Net.Voice.Mac.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf voicemac
unzip -n -q Net.Agora.Voice.Mac.$MACVERSION.7.nupkg -d voicemac
unzip -n -q Net.Agora.Voice.Mac.$MACVERSION.8.nupkg -d voicemac
rm Net.Agora.Voice.Mac.$MACVERSION.7.nupkg
rm Net.Agora.Voice.Mac.$MACVERSION.8.nupkg
cd ..
echo "mac part nugets generated"
echo "$ANDROIDVERSION" > Bindings/Agora.Net.Voice.Android/Readme.md
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$ANDROIDVERSION.7/" Bindings/Agora.Net.Voice.Android/Agora.Net.Voice.Android.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-android/<TargetFramework>net7.0-android/" Bindings/Agora.Net.Voice.Android/Agora.Net.Voice.Android.csproj
dotnet pack Bindings/Agora.Net.Voice.Android/Agora.Net.Voice.Android.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
sed -E -i "" "s/<Version>([0-9]{1,}\.)+[0-9]{1,}/<Version>$ANDROIDVERSION.8/" Bindings/Agora.Net.Voice.Android/Agora.Net.Voice.Android.csproj
sed -E -i "" "s/<TargetFramework>net([0-9]{1,}\.)+[0-9]{1,}-android/<TargetFramework>net8.0-android/" Bindings/Agora.Net.Voice.Android/Agora.Net.Voice.Android.csproj
dotnet pack Bindings/Agora.Net.Voice.Android/Agora.Net.Voice.Android.csproj --output NugetPackages --force --verbosity quiet --property WarningLevel=0 /clp:ErrorsOnly
cd NugetPackages
rm -rf voiceandroid
unzip -n -q Net.Agora.Voice.Android.$ANDROIDVERSION.7.nupkg -d voiceandroid
unzip -n -q Net.Agora.Voice.Android.$ANDROIDVERSION.8.nupkg -d voiceandroid
rm Net.Agora.Voice.Android.$ANDROIDVERSION.7.nupkg
rm Net.Agora.Voice.Android.$ANDROIDVERSION.8.nupkg
cd ..
echo "android part nugets generated"
cd NugetPackages

cp -R voiceandroid/Readme.md voiceandroid/Readme.txt
cp -R voicemac/Readme.md voicemac/Readme.txt
cp -R voiceios/Readme.md voiceios/Readme.txt
# 
# mkdir Voice/native
# mkdir Voice/native/lib
# mkdir Voice/native/lib/ios
# cp -R webrtc/lib/net8.0-android34.0/webrtc.aar webrtc/native/lib/android
# 
# rm webrtc/lib/net8.0-android34.0/webrtc.aar
# rm webrtc/lib/net7.0-android33.0/webrtc.aar 


sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$ANDROIDVERSION.$BUILD/" Net.Agora.Voice.Android.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$IOSVERSION.$BUILD/" Net.Agora.Voice.iOS.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$MACVERSION.$BUILD/" Net.Agora.Voice.Mac.nuspec
sed -E -i "" "s/<version>([0-9]{1,}\.)+[0-9]{1,}/<version>$VERSION.$BUILD/" Net.Agora.Voice.nuspec

nuget pack Net.Agora.Voice.Android.nuspec
nuget pack Net.Agora.Voice.iOS.nuspec
nuget pack Net.Agora.Voice.Mac.nuspec
nuget pack Net.Agora.Voice.nuspec

# rm -rf voiceandroid
# rm -rf voiceios
# rm -rf voicemac

# if  [ -z "$3" ]
# then
# echo "package ready"
# unzip -n -q OpenTok.Net.webrtc.Dependency.Android.$VERSION.$2.nupkg -d webrtc
# else 
# dotnet nuget push OpenTok.Net.webrtc.Dependency.Android.$VERSION.$2.nupkg --api-key $3 --source https://api.nuget.org/v3/index.json --timeout 3000000
# # rm OpenTok.Net.webrtc.Dependency.Android.$VERSION.$2.nupkg
# fi
# cd ..
fi