@ECHO OFF

set aadpath=.\AlbumArtDownloaderXUI-0.46
set aadbin=%aadpath%\AlbumArt.exe
set aadscripts=%aadpath%\Scripts

:: Musicbrainz
cp -u musicbrainz.boo %aadscripts%

:: Example from Musicbrainz
start %aadbin% /artist "Portishead" /album "Dummy" /sources "Musicbrainz"

:: Album which contains &. This album couldn't be found when characters like this got stripped
start %aadbin% /artist "Volbeat" /album "Outlaw gentlemen & shady ladies" /sources "Musicbrainz"

:: Had some unusual results while searching for this album
start %aadbin% /artist "The Real McKenzies" /album "10,000 shots" /sources "Musicbrainz"

:: Just an album name
start %aadbin% /album "Dummy" /sources "Musicbrainz"

:: 7digital Webservice
cp -u 7digital-ws.boo %aadscripts%

:: Example
start %aadbin% /artist "Portishead" /album "Dummy" /sources "7digital-ws"

:: Album with special characters
start %aadbin% /artist "Volbeat" /album "Outlaw gentlemen & shady ladies" /sources "7digital-ws"
