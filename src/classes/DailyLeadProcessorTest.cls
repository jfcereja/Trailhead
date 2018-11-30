@isTest
public class DailyLeadProcessorTest {
	
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    static testMethod void testDailyLeadProcessor(){
        List<Lead> ld1 = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            ld1.add(new Lead(firstName='Erlich',lastName='Bachman', Company = 'Aviator'));
        }
        insert ld1;
        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessor Test', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        system.assertEquals(200, [select count() from Lead where firstName='Erlich' and lastName = 'Bachman']);
    }
}