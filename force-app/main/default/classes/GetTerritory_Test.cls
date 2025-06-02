/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-08-2023
 * @last modified by  : Bradford Mar
**/
@isTest
public class GetTerritory_Test {
    @isTest static void method1(){
        //init(); create records
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/territory/33510';  
        req.httpMethod = 'GET';  
        RestContext.request = req;
        RestContext.response = res;

        GetTerritory.createSession();
        //System.assertEquals(JSON.serialize(res.responseBody), 'San_Diego');
        System.assertEquals(res.statusCode, 200);
        Test.stopTest();
    }
    @isTest static void method2(){
        Lead leadRecords = new Lead();
        leadRecords.firstName = 'test'; 
        leadRecords.lastName = 'test';
        leadRecords.email = 'test@gmail.com';
        leadRecords.mobilephone = '9999999999';
        leadRecords.company = 'xyz';
        leadRecords.LeadSource = 'BOOKED APPOINTMENT';
        leadRecords.Appointment_Time__c = '12:00 PM';
        leadRecords.Appointment_Date__c = system.today();
        leadRecords.Product_Interest__c = 'Bath';
        insert leadRecords;
        
        //init(); create records
        Test.startTest();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/services/apexrest/territory/'+leadRecords.Id;  
        req.httpMethod = 'GET';  
        RestContext.request = req;
        RestContext.response = res;

        GetTerritory.createSession();
        //System.assertEquals(JSON.serialize(res.responseBody), 'DALLAS');
        System.assertEquals(res.statusCode, 200);
        Test.stopTest();
    }
}