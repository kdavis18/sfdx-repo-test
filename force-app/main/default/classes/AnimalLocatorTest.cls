@isTest
private class AnimalLocatorTest {
    @isTest static  void testGetCallout() {
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        String name = AnimalLocator.getAnimalNameById(1);
        
        System.assert(name == 'Wolf');
    } 
}