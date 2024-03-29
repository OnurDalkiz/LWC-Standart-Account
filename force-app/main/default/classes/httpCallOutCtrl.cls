public class httpCallOutCtrl {
	// Pass in the endpoint to be used using the string url
	@AuraEnabled
	public static Map < String,	Object > getCalloutResponseContents(String url) {

		// Instantiate a new http object
		Http h = new Http();

		// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
		HttpRequest req = new HttpRequest();
		req.setEndpoint(url);
		req.setMethod('GET');
        req.setHeader('apikey', 'R2ANTiVvXpQLyoOGSz3PsMMFKCK23ywV');

		// Send the request, and return a response
		HttpResponse res = h.send(req);
		System.debug('response:--> ' + res.getBody());

		// Deserialize the JSON string into collections of primitive data types.
		Map < String, Object > resultsMap = (Map < String, Object > ) JSON.deserializeUntyped(res.getBody());
        list<object> resList = (list<object>) resultsMap.get('symbols');
		system.debug('resultsMap-->' + resultsMap);

		return resultsMap;
	}
}