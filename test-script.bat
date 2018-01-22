@ECHO OFF

set aadpath=..\AlbumArtDownloaderXUI-1.02
set aadbin=%aadpath%\AlbumArt.exe
set aadscripts=%aadpath%\Scripts

:: Musicbrainz
::copy musicbrainz.boo %aadscripts%
:: Example from Musicbrainz
::start %aadbin% /artist "Portishead" /album "Dummy" /sources "Musicbrainz"
:: Album which contains &. This album couldn't be found when characters like this got stripped
::start %aadbin% /artist "Volbeat" /album "Outlaw gentlemen & shady ladies" /sources "Musicbrainz"
:: Had some unusual results while searching for this album
::start %aadbin% /artist "The Real McKenzies" /album "10,000 shots" /sources "Musicbrainz"
:: Multiple artists
::start %aadbin% /artist "Leatherface & Hot Water Music" /album "BYO Split Series, Volume I" /sources "Musicbrainz"
:: Just an album name
::start %aadbin% /album "Dummy" /sources "Musicbrainz"
:: Encoding of  ! # $ % & ' ( ) * + , / : ; = ? @ [ ] for Lucene
::start %aadbin% /artist "Oasis" /album "(What's the Story) Morning Glory?" /sources "Musicbrainz"
:: Less strict search with lucene groupings
::start %aadbin% /artist "xploschns in se sky" /album "how strance, inno" /sources "Musicbrainz"
:: Other cover art types
::start %aadbin% /artist "Matula" /album "Kolumbus EP" /sources "Musicbrainz"
::start %aadbin% /artist "Die Žrzte" /album "Le Frisur" /sources "Musicbrainz"


:: 7digital Webservice
::copy 7digital-ws.boo %aadscripts%
:: Example
::start %aadbin% /artist "Portishead" /album "Dummy" /sources "7digital-ws"
:: Album with special characters
::start %aadbin% /artist "Volbeat" /album "Outlaw gentlemen & shady ladies" /sources "7digital-ws"

:: Discogs
::copy discogs.boo %aadscripts%
:: Example
::start %aadbin% /artist "Beatsteaks" /album "Beatsteaks" /sources "Discogs"

:: Bandcamp
copy bandcamp.boo %aadscripts%
:: Example
start %aadbin% /artist "Big Walnuts Yonder" /album "Big Walnuts Yonder" /sources "Bandcamp"
start %aadbin% /artist "Punk Goes 8-Bit" /album "Punk Goes 8-Bit: Level 5" /sources "Bandcamp"
