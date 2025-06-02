/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-03-2023
 * @last modified by  : Bradford Mar
**/
@isTest
public class GetSlots_Test {
    @isTest static void method1(){
        Zip_Code__c zip = new Zip_Code__c(Name = '92126',Location__c = 'Tampa Bay',City__c = 'Miramar',County__c = 'Tampa Bay County',State__c = 'CA',Vertical__c = 'BATH');

        //init(); create records
        Lead leadRecords = new Lead();
        leadRecords.firstName = 'test'; 
        leadRecords.lastName = 'test';
        leadRecords.email = 'test@gmail.com';
        leadRecords.mobilephone = '9999999999';
        leadRecords.Status = 'BOOKED APPOINTMENT';
        leadRecords.company = 'xyz';
        leadRecords.Appointment_Time__c = '1:00 PM';
        leadRecords.Appointment_Date__c = Date.parse('5/1/2023');
        leadRecords.Product_Interest__c = 'BATH';
        leadRecords.Location__c = 'Tampa Bay';
        insert leadRecords;
        
        // Id recType = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Customer').getRecordTypeId();RecordTypeId = recType
        Account a = new Account();
        a.Name = 'test';
        a.BillingPostalCode = '92126';
        a.Location__c = 'Tampa Bay';
        // a.Product_Interest__c = 'BATH';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.Id;
        c.firstName = 'test2'; 
        c.lastName = 'test2';
        c.email = 'test2@gmail.com';
        c.MobilePhone = '9999999999';
        insert c;
        
        // Id orecType = Schema.SObjectType.Opportunity.getRecordTypeInfosByName().get('BATH').getRecordTypeId();RecordTypeId = orecType
        Opportunity o = new Opportunity();
        o.AccountId = a.id;
        o.Name = a.Name + '-';
        o.StageName = 'SITE VISIT SCHEDULED';
        o.CloseDate = Date.newInstance(2022, 11, 1);
        o.Appointment_Date__c = Date.parse('5/1/2023');
        o.Appointment_Time__c = '10:00 AM';
        o.Opportunity_Type__c = 'BATH';
        o.Location__c = 'Tampa Bay';
        insert o;
        
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/slots/Tampa_Bay:2023-05-01';  
        req.httpMethod = 'GET';  
        RestContext.request = req;
        RestContext.response = res;

        GetSlots.createSession();
        //System.assertEquals(JSON.serialize(res.responseBody), 'Tampa Bay');
        System.assertEquals(res.statusCode, 200);
    }
}