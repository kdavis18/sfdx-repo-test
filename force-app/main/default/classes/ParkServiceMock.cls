@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {

      /********** expected result *************/
      //response_x = response_map_x.get('response_x');
      //return response_x.return_x;

      ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
      response_x.return_x = new List<String>{'Cat Park','Dog Park','Human Park'};

      response.put('response_x', response_x);               
   }
}