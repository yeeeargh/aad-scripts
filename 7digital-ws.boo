import System
import System.Xml
import AlbumArtDownloader.Scripts
import util

class SevenDigitalWS(AlbumArtDownloader.Scripts.IScript):
	Name as string:
		get: return "7digital-ws"
	Version as string:
		get: return "0.2"
	Author as string:
		get: return "Sebastian Hauser, Alex Vallat"
	
	
	def Search(artist as string, album as string, results as IScriptResults):
		if(artist!= null and album!=null):
			//artist = StripCharacters("&.'\";:?!", artist)
			//album = StripCharacters("&.'\";:?!", album)
			
			//url = GetUrl("Portishead", "Dummy") //Test for album Portishead - Dummy
			url = GetUrl(artist, album)
			
			xmlDoc = System.Xml.XmlDocument()
			
			try:
				xmlDoc.Load(url)
				stateNode=xmlDoc.SelectSingleNode("response");
				if stateNode.Attributes.GetNamedItem("status").InnerText == "ok":
					//Status was 'ok'
					resultNodes = xmlDoc.SelectNodes("response/searchResults/searchResult")
					results.EstimatedCount = resultNodes.Count
					
					//results are sorted by score. get first score and discard all results where the score is less then 60% of that score.
					scoreThreshold = System.Convert.ToDouble(resultNodes[0].SelectSingleNode("score").InnerText, System.Globalization.CultureInfo.InvariantCulture) * 0.6
					
					for node as XmlNode in resultNodes:
						resultScore = System.Convert.ToDouble(node.SelectSingleNode("score").InnerText, System.Globalization.CultureInfo.InvariantCulture)
						
						if resultScore > scoreThreshold:
							resultArtist = node.SelectSingleNode("release/artist/name").InnerText
							resultAlbum = node.SelectSingleNode("release/title").InnerText
							resultName = resultArtist + " - " + resultAlbum
							resultInfoUrl = node.SelectSingleNode("release/url").InnerText
							resultThumbnailUrl = node.SelectSingleNode("release/image").InnerText

							imageUrlBase = resultThumbnailUrl.Substring(0, resultThumbnailUrl.Length - "_50.jpg".Length)
							resultPicUrl as string
							resultPicSize as int
							
							//Detect if 800x800 size is available
							if CheckResponse(imageUrlBase, "800"):
								resultPicUrl = imageUrlBase + "_800.jpg"
								resultPicSize = 800;
							elif CheckResponse(imageUrlBase, "500"):
								//fall back on 500x500
								resultPicUrl = imageUrlBase + "_500.jpg"
								resultPicSize = 500;
							else:
								//fall back on 350x350 image
								resultPicUrl = imageUrlBase + "_350.jpg"
								resultPicSize = 350;

							results.Add(resultThumbnailUrl, resultName, resultInfoUrl, resultPicSize, resultPicSize, resultPicUrl, CoverType.Front)
						
						else:
							results.EstimatedCount--
				
				else:
					//Status was not 'ok'
					results.EstimatedCount = 0
			
			except e:
				return
		
		else:
			//both Parameter album and artist are necessary
			results.EstimatedCount = 0;
	
	
	def GetUrl(artist as string, album as string):
		encodedArtist = EncodeUrl(artist)
		encodedAlbum = EncodeUrl(album)
		baseUrl = "http://api.7digital.com/1.2/release/"
		apiKey = "YOUR_KEY_HERE"
		
		if artist == "" and album == "":
			return "${baseUrl}search?q=&oauth_consumer_key=${apiKey}"
		elif artist == "":
			return "${baseUrl}search?q=${encodedAlbum}&oauth_consumer_key=${apiKey}"
		elif album == "":
			return "${baseUrl}search?q=${encodedArtist}&oauth_consumer_key=${apiKey}"
		else:
			return "${baseUrl}search?q=${encodedArtist}+${encodedAlbum}&oauth_consumer_key=${apiKey}"
	
	
	def RetrieveFullSizeImage(fullSizeCallbackParameter):
		return fullSizeCallbackParameter;
	
	
	def CheckResponse(image, size):
		checkRequest = System.Net.HttpWebRequest.Create(image + "_" + size + ".jpg") as System.Net.HttpWebRequest
		checkRequest.Method = "HEAD"
		checkRequest.AllowAutoRedirect = false
		try:
			response = checkRequest.GetResponse() as System.Net.HttpWebResponse
			return response.StatusCode == System.Net.HttpStatusCode.OK
		except e as System.Net.WebException:
			return false;
		ensure:
			if response != null:
				response.Close()
