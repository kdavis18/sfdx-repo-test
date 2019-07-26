public class GetGoogleDistance {
    private static String keyStr = 'AIzaSyCKfkf66DbDHu7zmWI9vLbyp--_4gqv3pM';
    
    public static void getDistance(){
		Http http = new Http();
        HttpRequest request = new HttpRequest();
        String url = 'https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=1352 Balfour, Grosse Pointe Park MI,48230&destinations=18504 Beach Blvd, Huntington Beach CA, 92648';
        url+='&key=AIzaSyCKfkf66DbDHu7zmWI9vLbyp--_4gqv3pM';
		request.setEndpoint(url);
		request.setMethod('GET');
        
        System.debug(request);
        
		HttpResponse response = http.send(request);
		
        System.debug(response.getBody());
    }
}