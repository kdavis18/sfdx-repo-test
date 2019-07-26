public class QBOutboundInvoice {
    private static String clientId = 'Q0oycM6gP8vxivTzatsIxBItZMwo29D9XpmtDx9W3LKX25nKND';
    private static String secret = '5VzIbkatA9ZKsLPBZvMCMWqbXcWwRmPhUbwqymTw';
    private static String realmId = '193514608596764';
    
    public static void sendInvoice(){
    	Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        String url = 'https://appcenter.intuit.com/connect/oauth2';
        url+='?client_id='+clientId+'&'+'response_type=code';
        request.setEndpoint(url);
        //request.setHeader('Content-Type','application/json');
        //request.setBody(JSON.serializePretty(new Invoice()));
        
        HttpResponse response = http.send(request);
		
        System.debug(response.getBody());  
        
        //
       /* 
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/'+realmId+'/invoice');
        request.setHeader('Content-Type','application/json');
        request.setBody(JSON.serializePretty(new Invoice()));
        
        HttpResponse response = http.send(request);
		
        System.debug(response.getBody());
*/
    }
    
    private class Invoice{
        Customer CustomerRef;
        Date TxnDate;
        
        private Invoice(){
            CustomerRef = new Customer();
            TxnDate = Date.today();
        }
    }
    
    private class Customer{
        String value;
        String name;
        
        private Customer(){
            value = '3';
            name = 'Cool Cars';
        }
    }
}