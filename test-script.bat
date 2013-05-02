:: Example from Musicbrainz
start /d "C:\Program Files\AlbumArtDownloader" AlbumArt.exe /artist "Portishead" /album "Dummy" /sources "Musicbrainz"

:: Album which contains &. This album couldn't be found when characters like this got stripped
start /d "C:\Program Files\AlbumArtDownloader" AlbumArt.exe /artist "Volbeat" /album "Outlaw gentlemen & shady ladies" /sources "Musicbrainz"

:: Had some unusual results while searching for this album
start /d "C:\Program Files\AlbumArtDownloader" AlbumArt.exe /artist "The Real McKenzies" /album "10,000 shots" /sources "Musicbrainz"