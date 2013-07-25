aad-scripts
===========
Additional scripts for Album Art Downloader.

http://sourceforge.net/projects/album-art/

http://sourceforge.net/apps/mediawiki/album-art/index.php?title=Writing_Script_Files#Helper_methods_provided_by_util.boo


musicbrainz.boo
--------
Uses MusicBrainz and Cover Art Archive for obtaining covers. Both services provide their data in json format. The script parses the json files, gets the right albums an tries to get the covers linked to them.

### Documentation
http://musicbrainz.org/doc/Development/JSON_Web_Service

http://musicbrainz.org/doc/Cover_Art_Archive/API

### Example URLs
Portishead - Dummy

http://www.musicbrainz.org/ws/2/release?query="Dummy"&artist="Portishead"&fmt=json

http://coverartarchive.org/release/76df3287-6cda-33eb-8e9a-044b5e15ffdd/


7digital-ws.boo
--------
Uses 7digital for obtaining covers. I modified the script from Alex Vallat to use their webservice instead of the website. This way I can use their score to filter out obvious errors.
Unfortunately their ToS more or less forbids the use of their webservice for this script, so it shouldn't be used. I'll keep it for documentation though.

### Documentation
http://developer.7digital.com/resources/api-docs

http://developer.7digital.com/resources/api-docs/api-basics#Image_sizes_of_cover_art_and_artist_pictures

http://developer.7digital.com/resources/api-docs/catalogue-api#release/search

### Example URLs
Portishead - Dummy

http://api.7digital.com/1.2/release/search?q=Portishead+Dummy&oauth_consumer_key=YOUR_KEY_HERE


test-script.bat
--------
This is simple test script. It starts a few searches which were faulty in the past to see if everything still works.


debug
--------
you can create a logfile for debugging

System.IO.File.WriteAllText("debug.log", "CREATE DEBUG FILE" + "\n")
System.IO.File.AppendAllText("debug.log", "APPEND DEBUG MESSAGE + "\n")