/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 04-27-2023
 * @last modified by  : Bradford Mar
**/
@RestResource(urlMapping='/slots/*')
global without sharing class GetSlots {
    @HttpGet
    global static void createSession() {
        System.RestRequest req = RestContext.request;
        System.RestResponse res = RestContext.response;
        
        String urldata = RestContext.request.requestURI.subString(RestContext.request.requestURI.lastIndexOf('/') + 1);
        List<String> data = urldata.split(':');
        
        String territory = data[0].replace('_',' ');
        Date dateID = Date.valueOf(data[1]);//2022-09-03
        
        Map<String,Integer> timeSlots = new Map<String,Integer>();
        AggregateResult[] oppSlots = [select appointment_time__c, count(Id) total from Opportunity where isClosed = false and StageName in ('SITE VISIT SCHEDULED') and Location__c = :territory and appointment_date__c = :dateID group by appointment_time__c];
        
        System.debug(JSON.serializePretty(oppSlots));
        
        if (oppSlots.size() > 0) {
            for (AggregateResult oppSlot : oppSlots) {
                String apptTime = (String) oppSlot.get('appointment_time__c');
                List<String> apptArr = apptTime.split(' ');
                Boolean add12 = apptArr[1].substring(0,1) == 'P';
                List<String> timeArr = apptArr[0].split(':');
                Integer timeNum = (add12 && timeArr[0] != '12') ? Integer.valueOf(timeArr[0]) + 12 : (!add12 && timeArr[0] == '12') ? 0 : Integer.valueOf(timeArr[0]);
                String timeStr = 'T'+String.valueOf(timeNum) + timeArr[1];
                if (!timeSlots.containsKey(timeStr)) {
                    timeSlots.put(timeStr, (Integer) oppSlot.get('total'));
                }
            }
        }

        AggregateResult[] leadSlots = [select appointment_time__c, count(Id) total from Lead where isConverted = false and Status in ('BOOKED APPOINTMENT') and Location__c = :territory and appointment_date__c = :dateID group by appointment_time__c];

        System.debug(JSON.serializePretty(leadSlots));
        
        if (leadSlots.size() > 0) {
            for (AggregateResult leadSlot : leadSlots) {
                String apptTime = (String) leadSlot.get('appointment_time__c');
                List<String> apptArr = apptTime.split(' ');
                Boolean add12 = apptArr[1].substring(0,1) == 'P';
                List<String> timeArr = apptArr[0].split(':');
                Integer timeNum = (add12 && timeArr[0] != '12') ? Integer.valueOf(timeArr[0]) + 12 : (!add12 && timeArr[0] == '12') ? 0 : Integer.valueOf(timeArr[0]);
                String timeStr = 'T'+String.valueOf(timeNum) + timeArr[1];
                if (!timeSlots.containsKey(timeStr)) {
                    timeSlots.put(timeStr, (Integer) leadSlot.get('total'));
                } else {
                    Integer addSlots = timeSlots.get(timeStr) + ((Integer) leadSlot.get('total'));
                    timeSlots.put(timeStr, addSlots);
                }
            }
        }
        res.statusCode = 200;
        res.responseBody = Blob.valueOf(JSON.serialize(timeSlots));
    }
}