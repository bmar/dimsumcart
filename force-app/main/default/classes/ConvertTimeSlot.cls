/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-10-2024
 * @last modified by  : Bradford Mar
**/
public with sharing class ConvertTimeSlot {
    @InvocableMethod(label='Get Nearest Timeslot' description='Returns a time string')
    public static List<String> getNearestSlot(List<AppointmentRequest> requests) {
        List<String> results = new List<String>();
        for (AppointmentRequest request : requests) {
            List<String> slotsDefault = new List<String>();
            List<String> slots = new List<String>();
            List<Schema.PicklistEntry> ple = Schema.getGlobalDescribe().get(request.forObject).getDescribe().fields.getMap().get(request.fromField).getDescribe().getPicklistValues();
            for (Integer i=ple.size()-1; i>=0; i--) {
                slotsDefault.add(ple[i].getLabel());
            }
            
            if (String.isEmpty(request.location)) {
                slots = slotsDefault.clone();
            } else {
                String dayOfWeek = request.appointment.format('EEEE');
                String queryString = 'SELECT '+ dayOfWeek +'_Time_Slots_Override__c FROM Location WHERE '+ dayOfWeek +'_Time_Slots_Override__c != NULL AND Sales_Location__c =\'' + request.location + '\' AND LocationType = \'Sales Territory\'';
                Schema.Location[] daySlots;
                daySlots = Database.query(queryString);
                if (daySlots.size() > 0) {
                    slots = (daySlots[0].get(dayOfWeek +'_Time_Slots_Override__c').toString().split(';'));
                } else {
                    Schema.Location[] dailySlots;
                    dailySlots = [SELECT Time_Slots__c FROM Location WHERE Sales_Location__c = :request.location AND LocationType = 'Sales Territory' ORDER BY CreatedDate DESC];
                    if (dailySlots.size() > 0) {
                        slots = (dailySlots[0].get('Time_Slots__c').toString().split(';'));
                    } else {
                        slots = slotsDefault.clone();
                    }
                }
            }

            String result = slots[0];
            if (request != null) {
                Integer reqMin = request.appointment.minute()*10/6;
                Integer intReq = request.appointment.hour()*100 + reqMin;
                Boolean ceiling = reqMin >= 50;
                Integer j=1000;
                for (String slot : slots) {
                    DateTime slotDT = DateTime.parse(System.now().format('MM/dd/YYYY') + ', ' + slot);
                    Integer intSlot = (slotDT.hour() + (slotDT.minute()/60))*100;
                    Integer diff = math.abs(intSlot-intReq);
                    if (diff < j) {
                        j = diff;
                        result = slot;
                    }
                }
                results.add(result);
            }
        }
        return results;
    }

    
    /* Input parameters for the Apex action */
    public class AppointmentRequest {
        @invocableVariable(label='Object API Name')
        public String forObject = 'lead';

        @invocableVariable(label='Field API Name')
        public String fromField = 'Appointment_Time__c';

        @invocableVariable(label='Date/Time value')
        public DateTime appointment;

        @invocableVariable(label='Location')
        public String location;
    }
}