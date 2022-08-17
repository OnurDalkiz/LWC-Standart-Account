public with sharing class CurrencyConverterService {

    @AuraEnabled(cacheable=true)
    public static double convert(string sourceCurrency, string targetCurrency, string amount) {

        
            HttpRequest req = new HttpRequest();
            HttpResponse res = new HttpResponse();
            Http http = new Http();
            string today = String.valueOf(System.today());
            req.setEndpoint('https://api.apilayer.com/fixer/convert?from='+sourceCurrency+'&to='+targetCurrency+'&amount='+amount+'&date='+today);
            req.setMethod('GET');
            req.setHeader('apikey', 'UlKR8PzI071eqv0F1DGBvtzZxNL2gIuA');
            res = http.send(req);
            Map<string, object> responseMap = (Map<string, object>) JSON.deserializeUntyped(res.getbody());
            return (double) responseMap.get('result');
        

        
    }

    @AuraEnabled(cacheable=true)
    public static Object  getSymbols(){  
        
            Http h = new Http();
            // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setEndpoint( 'https://api.apilayer.com/fixer/symbols' );
            req.setMethod('GET');
            req.setHeader('apikey', 'UlKR8PzI071eqv0F1DGBvtzZxNL2gIuA' );
            // Send the request, and return a response
            HttpResponse res = h.send(req);
            System.debug('response:--> ' + res.getBody());
            // Deserialize the JSON string into collections of primitive data types.
            Map < String, Object > resultsMap = (Map < String, Object > ) JSON.deserializeUntyped(res.getBody());
            system.debug('resultsMap-->' + resultsMap);
            return resultsMap.get('symbols');       
		
    }
        
}