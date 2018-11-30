@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> assertResult = new List<String>();
        assertResult.add('Hamburg Wadden Sea National Park');
        assertResult.add('Hainich National Park');
        assertResult.add('Bavarian Forest National Park');
        System.assertEquals(assertResult, ParkLocator.country('Germany'));
    }
}