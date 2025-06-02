@isTest(seeAllData=false)
public with sharing class ConvertTimeZone_Test {
    public static testMethod void method1() {
        test.startTest();

        Zip_Code__c zip = new Zip_Code__c(Name = '92126',Location__c = 'San Diego',City__c = 'Miramar',County__c = 'San Diego County',State__c = 'CA',Vertical__c = 'TURF');

        List<ConvertTimeZone.TimeZoneRequest> args = new List<ConvertTimeZone.TimeZoneRequest>();
        ConvertTimeZone.TimeZoneRequest request = new ConvertTimeZone.TimeZoneRequest();
        request.dttime = System.now();
        request.targetTimezone = 'America/Phoenix';
        request.sourceTimezone = 'America/Los_Angeles';
        args.add(request);
        List<DateTime> result = new List<DateTime>();
        result = ConvertTimeZone.getTimezoneAdjusted(args);
        test.stopTest();
    }
}