@isTest
private class ParkLocatorTest {
    
    @isTest
    static void testCallout(){
        Test.setMock(WebServiceMock.class, new ParkServiceMOck());
        String country = 'United States';
        List <String> expectedParks = new List <String>{'Yosemita', 'Sequoia', 'Crater Lake'};
        System.assertEquals(expectedParks, ParkLocator.country(country));
    }

}