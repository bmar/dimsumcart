/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-09-2023
 * @last modified by  : Bradford Mar
**/
@RestResource(urlMapping='/territory/*')
global without sharing class GetTerritory {
    @HttpGet
    global static void createSession() {
        System.RestRequest req = RestContext.request;
        System.RestResponse res = RestContext.response;
        
        String data = RestContext.request.requestURI.subString(RestContext.request.requestURI.lastIndexOf('/') + 1);
        
        Boolean isZip = data.length() == 5;
        Boolean isRecord = data.length() == 15 || data.length() == 18;
        Boolean isLead = isRecord && data.substring(0,3) == '00Q';
        
        Map <String,String> zipMap = new Map <String,String>{'location'=>'OUT_OF_TERRITORY','vertical'=>'Bath;Kitchen;Roofing;Room Additions;General Remodeling'};
        
        if (isZip) {
            Zip_Code__c[] zips = [select Location__c, Vertical__c, Name from Zip_Code__c where Name = :data and Location__c != 'NO APPOINTMENTS' order by CreatedDate asc];
            if (zips.size() > 0) {
                Zip_Code__c z1 = zips.get(0);
                zipMap = new Map <String,String>{'location'=>z1.Location__c.replaceAll(' ','_'),'vertical'=>z1.Vertical__c};
            }
        } else if (isLead) {
            Lead l = [select PostalCode from Lead where Id = :data];
            if (l.PostalCode != null && l.PostalCode.length() == 5) {
                Zip_Code__c[] zips = [select Location__c, Vertical__c, Name from Zip_Code__c where Name = :l.PostalCode and Location__c != 'NO APPOINTMENTS' order by CreatedDate asc];
                Zip_Code__c z1 = zips.get(0);
                zipMap = new Map <String,String>{'location'=>z1.Location__c.replaceAll(' ','_'),'vertical'=>z1.Vertical__c};
            }
        } else {
            
        }
        
        res.statusCode = 200;
        res.responseBody = Blob.valueOf(JSON.serialize(zipMap));
    }
}