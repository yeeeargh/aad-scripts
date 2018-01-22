import System
import System.Text.RegularExpressions
import AlbumArtDownloader.Scripts
import util

class Bandcamp(AlbumArtDownloader.Scripts.IScript, ICategorised):

	Name as string:
		get: return "bandcamp"
	Version as string:
		get: return "0.4"
	Author as string:
		get: return "Alex Vallat"
	Category as string:
		get: return "Independent"
	def Search(artist as string, album as string, results as IScriptResults):
		artist = StripCharacters("\";:?!", artist)
		album = StripCharacters("\";:?!", album)
		query = ""

		if (artist.Length!=0):
			query += EncodeUrl("\"${artist}\" ")
		if (album.Length!=0):
			query += EncodeUrl("\"${album}\"")

		//Retrieve the search results
		searchResultsHtml as string = GetPage("http://bandcamp.com/search?q=${query}")

		matches = Regex("<a class=\"artcont\" href=\"(?<url>[^\"]+)\">\\s*<div class=\"art\">\\s*<img src=\"https?:(?<img>[^\"]+?)_7\\.jpg\".*?<div class=\"heading\">\\s*<a[^>]+>\\s*(?<title>.+?)\\s*<", RegexOptions.Singleline | RegexOptions.IgnoreCase).Matches(searchResultsHtml)
		
		results.EstimatedCount = matches.Count
		
		for match as Match in matches:
			url = match.Groups["url"].Value;
			title = match.Groups["title"].Value;
			img = match.Groups["img"].Value;
			thumb = "http:" + img + "_7";
			full = "http:" + img + "_0";
			
			results.Add(thumb, title, url, -1, -1, full, CoverType.Front)

	def RetrieveFullSizeImage(url):
		return url
