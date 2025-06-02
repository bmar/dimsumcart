/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-02-2024
 * @last modified by  : Bradford Mar
**/
@isTest(seealldata= false)
public class AppointmentsController_Test {
    public static testMethod void withZip() {
        
        PageReference pgRef = Page.Appointments; //Create Page Reference - 'Appt_New' is the name of Page
        Test.setCurrentPage(pgRef); //Set the page for Test Method
        
        /*Schema.Location loc = new Schema.Location(
            Name = 'OUT_OF_TERRITORY',
            TimeZone = 'America/Los_Angeles',
            LocationType = 'Sales Territory',
            Sales_Location__c = 'NO APPOINTMENTS',
            Latency__c = 1,
            Limit__c = 14,
            Time_Slots__c = '10:00 AM;1:00 PM;4:00 PM;6:30 PM',
            Daily_Slot_1__c = 12,
            Daily_Slot_2__c = 12,
            Daily_Slot_3__c = 12,
            Daily_Slot_4__c = 19,
            Daily_Slot_5__c = 0,
            Daily_Slot_6__c = 0,
            Sunday_Time_Slots_Override__c = '10:00 AM;1:00 PM;4:00 PM;6:30 PM',
            Sunday_Slot_1__c = 0,
            Sunday_Slot_2__c = 0,
            Sunday_Slot_3__c = 0,
            Sunday_Slot_4__c = 0,
            Sunday_Slot_5__c = 0,
            Sunday_Slot_6__c = 0,
            Monday_Time_Slots_Override__c = '10:00 AM;1:00 PM;4:00 PM;6:30 PM',
            Monday_Slot_1__c = 0,
            Monday_Slot_2__c = 18,
            Monday_Slot_3__c = 18,
            Monday_Slot_4__c = 19,
            Monday_Slot_5__c = 0,
            Monday_Slot_6__c = 0,
            Tuesday_Time_Slots_Override__c = '10:00 AM;1:00 PM;4:00 PM;6:30 PM',
            Tuesday_Slot_1__c = 18,
            Tuesday_Slot_2__c = 0,
            Tuesday_Slot_3__c = 18,
            Tuesday_Slot_4__c = 19,
            Tuesday_Slot_5__c = 0,
            Tuesday_Slot_6__c = 0
        );
        insert loc;*/
        
        ApexPages.currentPage().getParameters().put('locate', '33510');//Pass Id to page 
        
        AppointmentsController a = new AppointmentsController();
        a.leadw.cu_FirstName = 'Bill'; 
        a.leadw.cu_LastName = 'Barr';
        a.leadw.cu_Email = 'bbarr@gmail.com';
        a.leadw.cu_PhoneNumber = '9999999999';
        a.leadw.cu_postalcode = '33510';
        a.leadw.cu_appointmentTime = '2:00 PM';
        a.leadw.cu_appointmentDate = '9/17/2025';
        a.leadw.cu_serviceType = 'Bath';
        a.leadw.cu_isAffirmedConsent = 'true';
        
        a.doSubmit();
        
        //a.getselectedaccnamefields();
        
    }
    public static testMethod void withLead() {
        Zip_Code__c zip = new Zip_Code__c(Name = '33510',Location__c = 'Tampa Bay',City__c = 'Tampa Bay',County__c = 'Tampa County',State__c = 'FL',Vertical__c = 'Bath');

        Lead leadRecords = new Lead();
        leadRecords.firstName = 'Donald'; 
        leadRecords.lastName = 'Bar';
        leadRecords.email = 'dbar@gmail.com';
        leadRecords.mobilephone = '5555555555';
        leadRecords.company = 'abc';
        leadRecords.PostalCode = '33510';
        leadRecords.Location__c = 'Tampa Bay';
        leadRecords.LeadSource = 'Kitchen';
        leadRecords.Appointment_Time__c = '12:00 PM';
        leadRecords.Appointment_Date__c = system.today();
        leadRecords.Product_Interest__c = 'Bath';
        insert leadRecords;
        
        PageReference pgRef = Page.Appointments; //Create Page Reference - 'Appt_New' is the name of Page
        Test.setCurrentPage(pgRef); //Set the page for Test Method
        ApexPages.currentPage().getParameters().put('locate', leadRecords.Id);//Pass Id to page 
        
        
        AppointmentsController a = new AppointmentsController();
        a.leadw.cu_appointmentDate = '9/17/2025';
        
        a.doSubmit();
        
        //a.getselectedaccnamefields();
        
    }
    public static testMethod void withConverted() {
        Zip_Code__c zip = new Zip_Code__c(Name = '33510',Location__c = 'Tampa Bay',City__c = 'Tampa Bay',County__c = 'Tampa County',State__c = 'FL',Vertical__c = 'Bath');
        User u = [SELECT Id FROM User WHERE Email != NULL LIMIT 1];
        
        Lead cl = new Lead();
        cl.firstName = 'John'; 
        cl.lastName = 'Souza';
        cl.email = 'john@gmail.com';
        cl.mobilephone = '9999999999';
        cl.PostalCode = '33510';
        cl.Location__c = 'Tampa Bay';
        cl.company = 'nyt';
        cl.LeadSource = 'BOOKED APPOINTMENT';
        cl.Appointment_Time__c = '10:00 AM';
        cl.Appointment_Date__c =  (Date) Date.valueOf('2025-09-01');
        cl.Expected_Attendees__c = 'ONE LEG';
        cl.Product_Interest__c = 'Bath';
        insert cl;
        
        Lead l2 = new Lead();
        l2.firstName = 'Phillip'; 
        l2.lastName = 'Sauza';
        l2.email = 'Phillip@gmail.com';
        l2.mobilephone = '8888888888';
        l2.PostalCode = '33510';
        l2.Location__c = 'Tampa Bay';
        l2.company = 'kwav';
        l2.LeadSource = 'BOOKED APPOINTMENT';
        l2.Appointment_Time__c = '10:00 AM';
        l2.Appointment_Date__c = (Date) Date.valueOf('2025-09-01');
        l2.Expected_Attendees__c = 'ONE LEG';
        l2.Product_Interest__c = 'Bath';
        insert l2;

        cl.OwnerId = u.Id;
        update cl;

        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(cl.id);
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true ORDER BY CreatedDate DESC LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        
        Lead l3 = new Lead();
        l3.firstName = 'Mary'; 
        l3.lastName = 'F';
        l3.email = 'kell@gmail.com';
        l3.mobilephone = '7777777777';
        l3.PostalCode = '33510';
        l3.Location__c = 'Tampa Bay';
        l3.company = 'ufc';
        l3.LeadSource = 'BOOKED APPOINTMENT';
        l3.Appointment_Time__c = '10:00 AM';
        l3.Appointment_Date__c = (Date) Date.valueOf('2025-09-01');
        l3.Expected_Attendees__c = 'ONE LEG';
        l3.Product_Interest__c = 'Bath';
        insert l3;

        PageReference pgRef = Page.Appointments; //Create Page Reference - 'Appt_New' is the name of Page
        Test.setCurrentPage(pgRef); //Set the page for Test Method
        ApexPages.currentPage().getParameters().put('locate', cl.Id);//Pass Id to page 
        
        AppointmentsController a = new AppointmentsController();
        a.leadw.cu_appointmentDate = '9/1/2025';
        a.leadw.cu_FirstName = 'Bill'; 
        a.leadw.cu_LastName = 'Barr';
        a.leadw.cu_Email = 'bbarr@gmail.com';
        a.leadw.cu_PhoneNumber = '3333333333';
        
        a.doSubmit();

        PageReference pgRef2 = Page.Appointments; //Create Page Reference - 'Appt_New' is the name of Page
        Test.setCurrentPage(pgRef2); //Set the page for Test Method
        ApexPages.currentPage().getParameters().put('locate', l3.Id);//Pass Id to page 
        
        AppointmentsController a2 = new AppointmentsController();
        a2.leadw.cu_appointmentDate = '9/1/2025';
        
        a2.doSubmit();

    }
    public static testMethod void badLead() {
        
        PageReference pgRef = Page.Appointments; //Create Page Reference - 'Appt_New' is the name of Page
        Test.setCurrentPage(pgRef); //Set the page for Test Method
        ApexPages.currentPage().getParameters().put('locate', '00Q123456789123');//Pass Id to page 
        
        AppointmentsController a = new AppointmentsController();
    }
    public static testMethod void noPreset() {
        
        PageReference pgRef = Page.Appointments; //Create Page Reference - 'Appt_New' is the name of Page
        Test.setCurrentPage(pgRef); //Set the page for Test Method
        ApexPages.currentPage().getParameters().put('utm_content', 'SOCIAL MEDIA ALL'); 
        
        AppointmentsController a = new AppointmentsController();
        a.setLocate();
    }
}