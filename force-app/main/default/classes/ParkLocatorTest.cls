@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> result = ParkLocator.country('Germany');
        // Verify that a fake result is returned
        System.assert(result[0] == 'Cat Park');
    }
}