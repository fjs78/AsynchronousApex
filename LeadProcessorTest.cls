@isTest
public class LeadProcessorTest {

    @testSetup
    static void setupLeads() {
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0; i<200; i++) {
            leadList.add(new Lead(LastName = 'Test Lead' + String.valueof(i), Company = 'Test Company' + String.valueof(i)));
        }
        insert leadList;
    }

    @isTest
    static void testBatch() {
        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
        
    }

}