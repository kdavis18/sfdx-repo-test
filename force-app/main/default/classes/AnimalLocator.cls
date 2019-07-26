public class AnimalLocator {

    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        
        HttpResponse response = http.send(request);
        String name = '';
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>)results.get('animal');
			name = (String)animal.get('name');
        }
        
        return name;
    }
    
}