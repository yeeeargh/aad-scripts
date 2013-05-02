aad-scripts
===========

Album Art Downloader Scripts
Additional scripts for Album Art Downloader

http://sourceforge.net/projects/album-art/

http://sourceforge.net/apps/mediawiki/album-art/index.php?title=Writing_Script_Files#Helper_methods_provided_by_util.boo

musicbrainz.boo
--------
Uses Musicbrainz and Cover Art Archive for obtaining covers. Both services provide their data in json format. The script parses the json files, gets the right albums an tries to get the covers linked to them.
### Example URLs
Portishead - Dummy

http://www.musicbrainz.org/ws/2/release?query="Dummy"&artist="Portishead"&fmt=json

http://coverartarchive.org/release/76df3287-6cda-33eb-8e9a-044b5e15ffdd/
