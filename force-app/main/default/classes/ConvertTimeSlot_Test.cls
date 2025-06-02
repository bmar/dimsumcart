/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-10-2024
 * @last modified by  : Bradford Mar
**/
@isTest (seealldata= false)
public without sharing class ConvertTimeSlot_Test {
    public static testMethod void method1() {
        test.startTest();
        Schema.Location loc = new Schema.Location(
            Name = 'Tampa Bay',
            TimeZone = 'America/Los_Angeles',
            LocationType = 'Sales Territory',
            Sales_Location__c = 'Tampa Bay',
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
        insert loc;

        Zip_Code__c zip = new Zip_Code__c(Name = '92126',Location__c = 'Tampa Bay',City__c = 'Miramar',County__c = 'Tampa Bay County',State__c = 'CA',Vertical__c = 'TURF');

        List<ConvertTimeSlot.AppointmentRequest> args = new List<ConvertTimeSlot.AppointmentRequest>();
        ConvertTimeSlot.AppointmentRequest request = new ConvertTimeSlot.AppointmentRequest();
        request.forObject = 'lead';
        request.fromField = 'Appointment_Time__c';
        request.appointment = DateTime.parse('5/8/2023, 10:00 AM');
        request.location = 'Tampa Bay';
        args.add(request);
        List<String> result = new List<String>();
        result = ConvertTimeSlot.getNearestSlot(args);
        test.stopTest();
    }
    public static testMethod void method2() {
        test.startTest();

        Zip_Code__c zip = new Zip_Code__c(Name = '92126',Location__c = 'Tampa Bay',City__c = 'Miramar',County__c = 'Tampa Bay County',State__c = 'CA',Vertical__c = 'TURF');

        List<ConvertTimeSlot.AppointmentRequest> args = new List<ConvertTimeSlot.AppointmentRequest>();
        ConvertTimeSlot.AppointmentRequest request = new ConvertTimeSlot.AppointmentRequest();
        request.forObject = 'lead';
        request.fromField = 'Appointment_Time__c';
        request.appointment = DateTime.parse('5/8/2023, 10:00 AM');
        request.location = 'Tampa Bay';
        args.add(request);
        List<String> result = new List<String>();
        result = ConvertTimeSlot.getNearestSlot(args);
        test.stopTest();
    }
    public static testMethod void method3() {
        test.startTest();

        Zip_Code__c zip = new Zip_Code__c(Name = '92126',Location__c = 'Tampa Bay',City__c = 'Miramar',County__c = 'Tampa Bay County',State__c = 'CA',Vertical__c = 'TURF');

        List<ConvertTimeSlot.AppointmentRequest> args = new List<ConvertTimeSlot.AppointmentRequest>();
        ConvertTimeSlot.AppointmentRequest request = new ConvertTimeSlot.AppointmentRequest();
        request.forObject = 'lead';
        request.fromField = 'Appointment_Time__c';
        request.appointment = DateTime.parse('5/8/2023, 10:00 AM');
        args.add(request);
        List<String> result = new List<String>();
        result = ConvertTimeSlot.getNearestSlot(args);
        test.stopTest();
    }
}