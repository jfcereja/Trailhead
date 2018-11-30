@isTest
public class AnimalLocatorTest {
    @isTest static void AnimalLocatorMock(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(1);
    }
}