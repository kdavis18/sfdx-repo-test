public class ParkLocator {

	public static List<String> country(String country){
		ParkService.ParksImplPort service = new ParkService.ParksImplPort();
		List<String> parks = service.byCountry(country);

		return parks;
	}

}