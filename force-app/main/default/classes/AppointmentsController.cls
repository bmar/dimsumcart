/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-16-2025
 * @last modified by  : Bradford Mar
**/
public Without Sharing class AppointmentsController {
    public String sched{get;set;}
    public String baseUrl{get;set;}
    public String cu_id{get;set;}
    public LeadWrapper leadw{get;set;}
    public String lead_source{get;set;}
    public String cu_referrer{get;set;}
    public Boolean isPavers{get;set;} 
    public Boolean cu_found{get;set;} 
/*    
    //Affirmative Consent
    public Boolean isAffirmedConsent{get;set;}
    
    //Product Interest changes to Checkbox
    public Boolean isCheckedTurf{get;set;}
    public Boolean isCheckedWindows{get;set;}
*/
    public class LeadWrapper{
        //public ID Id{get;set;}
        public String cu_FirstName{get;set;}
        public String cu_LastName{get;set;}
        public String cu_Email{get;set;}
        public String cu_PhoneNumber{get;set;}
        public String cu_street{get;set;}
        public String cu_city{get;set;}
        public String cu_appointmentDate{get;set;}
        public String cu_appointmentTime{get;set;}
        public String cu_serviceType{get;set;}
        public String cu_postalcode{get;set;}
        public String cu_isAffirmedConsent{get;set;}
        public String cu_territory{get;set;}
        public String cu_howfind{get;set;}
    }

    public class BookingLocation{
        public String Name{get;set;}
        public String Sales_Location_c{get;set;}
        public String TimeZone{get;set;}
        public String LocationType{get;set;}
        public Integer Latency_c{get;set;}
        public Integer Limit_c{get;set;}
        public String Time_Slots_c{get;set;}
        public Integer Daily_Slot_1_c{get;set;}
        public Integer Daily_Slot_2_c{get;set;}
        public Integer Daily_Slot_3_c{get;set;}
        public Integer Daily_Slot_4_c{get;set;}
        public Integer Daily_Slot_5_c{get;set;}
        public Integer Daily_Slot_6_c{get;set;}
        public String Sunday_Time_Slots_Override_c{get;set;}
        public Integer Sunday_Slot_1_c{get;set;}
        public Integer Sunday_Slot_2_c{get;set;}
        public Integer Sunday_Slot_3_c{get;set;}
        public Integer Sunday_Slot_4_c{get;set;}
        public Integer Sunday_Slot_5_c{get;set;}
        public Integer Sunday_Slot_6_c{get;set;}
        public String Monday_Time_Slots_Override_c{get;set;}
        public Integer Monday_Slot_1_c{get;set;}
        public Integer Monday_Slot_2_c{get;set;}
        public Integer Monday_Slot_3_c{get;set;}
        public Integer Monday_Slot_4_c{get;set;}
        public Integer Monday_Slot_5_c{get;set;}
        public Integer Monday_Slot_6_c{get;set;}
        public String Tuesday_Time_Slots_Override_c{get;set;}
        public Integer Tuesday_Slot_1_c{get;set;}
        public Integer Tuesday_Slot_2_c{get;set;}
        public Integer Tuesday_Slot_3_c{get;set;}
        public Integer Tuesday_Slot_4_c{get;set;}
        public Integer Tuesday_Slot_5_c{get;set;}
        public Integer Tuesday_Slot_6_c{get;set;}
        public String Wednesday_Time_Slots_Override_c{get;set;}
        public Integer Wednesday_Slot_1_c{get;set;}
        public Integer Wednesday_Slot_2_c{get;set;}
        public Integer Wednesday_Slot_3_c{get;set;}
        public Integer Wednesday_Slot_4_c{get;set;}
        public Integer Wednesday_Slot_5_c{get;set;}
        public Integer Wednesday_Slot_6_c{get;set;}
        public String Thursday_Time_Slots_Override_c{get;set;}
        public Integer Thursday_Slot_1_c{get;set;}
        public Integer Thursday_Slot_2_c{get;set;}
        public Integer Thursday_Slot_3_c{get;set;}
        public Integer Thursday_Slot_4_c{get;set;}
        public Integer Thursday_Slot_5_c{get;set;}
        public Integer Thursday_Slot_6_c{get;set;}
        public String Friday_Time_Slots_Override_c{get;set;}
        public Integer Friday_Slot_1_c{get;set;}
        public Integer Friday_Slot_2_c{get;set;}
        public Integer Friday_Slot_3_c{get;set;}
        public Integer Friday_Slot_4_c{get;set;}
        public Integer Friday_Slot_5_c{get;set;}
        public Integer Friday_Slot_6_c{get;set;}
        public String Saturday_Time_Slots_Override_c{get;set;}
        public Integer Saturday_Slot_1_c{get;set;}
        public Integer Saturday_Slot_2_c{get;set;}
        public Integer Saturday_Slot_3_c{get;set;}
        public Integer Saturday_Slot_4_c{get;set;}
        public Integer Saturday_Slot_5_c{get;set;}
        public Integer Saturday_Slot_6_c{get;set;}
    }
    
    public static Integer DayUnmask(Integer mask) {
        switch on mask {
            when 1 {
                return 5;//0;
            }
            when 2 {
                return 4;//1;
            }
            when 4 {
                return 3;//2;
            }
            when 8 {
                return 2;//3;
            }
            when 16 {
                return 1;//4;
            }
            when 32 {
                return 0;//5;
            }
            when 64 {
                return 6;//6;
            }
            when else {
                return 0;
            }
        }
    }

    public static Integer weekCount(String count) {
        switch on count {
            when 'First' {
                return 0;
            }
            when 'Second' {
                return 7;
            }
            when 'Third' {
                return 14;
            }
            when 'Fourth' {
                return 21;
            }
            when else {
                return 28;
            }
        }
    }

    public static Integer dayOfWeekNumber(Date aDate) {
        return Math.mod(Date.newInstance(1900, 1, 7).daysBetween(aDate),7);
    }

    // public static Date currentNth(Integer dayMask, Integer count, Date aDate) {
    //     Integer dayToCount = DayUnmask(dayMask);
    //     Integer weekToCount = weekCount(count);
    //     Date nthDate = Date.newInstance(Date.Today().year(), aDate.month(), 1);
    //     Integer nthStart = dayOfWeekNumber(nthDate);
    //     switch on nthStart {
    //         when 0 {
    //             if (dayToCount == nthStart) {
    //                 return Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),5 + weekToCount);
    //             }
    //         }
    //         when 1 {
    //             if (dayToCount == nthStart) {
    //                 return Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),4 + weekToCount);
    //             }
    //         }
    //         when 2 {
    //             if (dayToCount == nthStart) {
    //                 return Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),3 + weekToCount);
    //             }
    //         }
    //         when 3 {
    //             if (dayToCount == nthStart) {
    //                 return Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),2 + weekToCount);
    //             }
    //         }
    //         when 4 {
    //             if (dayToCount == nthStart) {
    //                 return Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),1 + weekToCount);
    //             }
    //         }
    //         when 5 {
    //             if (dayToCount == nthStart) {
    //                 return Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),0 + weekToCount);
    //             }
    //         }
    //         when 6 {
    //             if (dayToCount == nthStart) {
    //                 return Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),6 + weekToCount);
    //             }
    //         }
    //         when else {
    //             return Date.today();
    //         }
    //     }
    // }

    public AppointmentsController() {
        cu_referrer = (apexpages.currentPage().getheaders().get('Referer') != null) ? apexpages.currentPage().getheaders().get('Referer') : '';
        isPavers = (cu_referrer.indexOf('lilikoiagency.com') >= 0)? true : false;
        lead_source = (ApexPages.CurrentPage().getparameters().get('utm_content') != null) ? ApexPages.CurrentPage().getparameters().get('utm_content') : (isPavers)? 'WEBSITE MAIN PAVERS ALL' : 'WEBSITE MAIN ALL';
        if(ApexPages.CurrentPage().getparameters().get('locate') != null) {
            String data = ApexPages.CurrentPage().getparameters().get('locate');
            Boolean isZip = (data != null) ? data.length() == 5: false;
            Boolean isRecord = (data != null) ? data.length() == 15 || data.length() == 18 : false;
            Boolean isLead = (data != null) ? isRecord && data.substring(0,3) == '00Q' : false;
            
            leadw = new LeadWrapper();
            cu_id = 'None';
            if (isZip) {
                leadw.cu_postalcode = data;
            } else if (isLead) {
                Lead[] leads = [select isConverted,FirstName,postalcode,Location__c,LastName,email,MobilePhone,city,street,Product_Interest__c,Marketing_Email_OK__c,Appointment_Date__c,Appointment_Time__c from Lead where id=: data];
                if (leads.size() > 0) {
                    cu_id = data;
                    Lead leadRecords = leads.get(0);
                    //leadw.Id = leadRecords.Id;
                    //cu_id = String.valueOf(leadRecords.Id);
                    leadw.cu_FirstName = leadRecords.FirstName;
                    leadw.cu_LastName = leadRecords.LastName;
                    leadw.cu_Email = leadRecords.email;
                    leadw.cu_PhoneNumber = leadRecords.MobilePhone;
                    leadw.cu_city = leadRecords.city;
                    leadw.cu_street = leadRecords.street;
                    leadw.cu_isAffirmedConsent = String.valueOf(leadRecords.Marketing_Email_OK__c);
                    leadw.cu_postalcode = leadRecords.postalcode;
                    leadw.cu_territory = leadRecords.Location__c;
                    /*if(leadRecords.Product_Interest__c != null) {
                        leadw.cu_serviceType = leadRecords.Product_Interest__c;
                    }*/
                    if(leadRecords.isConverted == true) {
                        leadw.cu_appointmentDate = leadRecords.Appointment_Date__c.Month() + '/' + leadRecords.Appointment_Date__c.Day() + '/' +leadRecords.Appointment_Date__c.Year();
                        leadw.cu_appointmentTime = leadRecords.Appointment_Time__c;
                        cu_found = true;
                        cu_id = 'Conv';
                    }
                    leadw.cu_howfind = '';
                }
            }
        }
        
        baseUrl = ApexPages.currentPage().getHeaders().get('X-Salesforce-Forwarded-To');
        List<String> suppress = new List<String>();
        Holiday[] holidays = [select ActivityDate, RecurrenceType, RecurrenceDayOfWeekMask, RecurrenceInstance from Holiday];
        for (Holiday holiday : holidays) {
            if (holiday.RecurrenceType == 'RecursYearly') {
                if ((holiday.ActivityDate.month() < Date.Today().Month() || (holiday.ActivityDate.month() == Date.today().month() && holiday.ActivityDate.day() <= Date.today().day()))) {
                    DateTime holidayDateTime = DateTime.newInstance(Date.today().year()+1, holiday.ActivityDate.month(), holiday.ActivityDate.day());
                    suppress.add(holidayDateTime.format('MMMM')+'_'+holidayDateTime.day()+'_'+holidayDateTime.year());
                } else {
                    suppress.add(Datetime.valueOf(holiday.ActivityDate + 'T09:01:01.000Z').format('MMMM')+'_'+holiday.ActivityDate.day()+'_'+Date.today().year());
                }
            } else if (holiday.RecurrenceType == 'RecursYearlyNth') {
                // nthDate = currentNth(holiday.RecurrenceDayOfWeekMask,holiday.RecurrenceInstance,holiday.ActivityDate);
                Integer dayToCount = DayUnmask(holiday.RecurrenceDayOfWeekMask);
                Integer weekToCount = weekCount(holiday.RecurrenceInstance);
                Integer addDays = dayToCount + weekToCount -1;
                Date nthDate = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(), 1);
                Integer nthStart = Math.mod(Date.newInstance(1900, 1, 7).daysBetween(nthDate),7);
                Date currentNth;
                switch on nthStart {
                    when 0 {
                            currentNth = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),5 + addDays);
                    }
                    when 1 {
                            currentNth = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),4 + addDays);
                    }
                    when 2 {
                            currentNth = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),3 + addDays);
                    }
                    when 3 {
                            currentNth = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),2 + addDays);
                    }
                    when 4 {
                            currentNth = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),1 + addDays);
                    }
                    when 5 {
                            currentNth = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),0 + addDays);
                    }
                    when 6 {
                            currentNth = Date.newInstance(Date.Today().year(), holiday.ActivityDate.month(),6 + addDays);
                    }
                    when else {
                        currentNth = Date.today();
                    }
                }
                suppress.add(Datetime.valueOf(currentNth + 'T09:01:01.000Z').format('MMMM')+'_'+currentNth.day()+'_'+currentNth.year());
            } else {
                suppress.add(Datetime.valueOf(holiday.ActivityDate + 'T09:01:01.000Z').format('MMMM')+'_'+holiday.ActivityDate.day()+'_'+holiday.ActivityDate.year());
            }
        }
        Map<String, Object> JSONterritories = new Map<String, Object>();
        Date currentDate = date.today();
        AggregateResult[] terrbookings = [select Location__c, appointment_date__c, count(Id) total from Opportunity where appointment_date__c > TODAY and StageName not in ('PLEASE RESCHEDULE','LEADS CONNECT REHASH REJECTED','Closed Lost') group by Location__c, appointment_date__c];
        Map<String,Map<String,Integer>> terrSupress = new Map<String,Map<String,Integer>>();
        if (terrbookings.size() > 0) {
            for (AggregateResult bookings : terrbookings) {
                String thisTerr = (String) bookings.get('Location__c');
                if (thisTerr != null) {
                    thisTerr = thisTerr.replace(' ','_');
                    String thisDate = Datetime.valueOf(bookings.get('appointment_date__c') + 'T09:01:01.000Z').format('MMMM')+'_'+Date.valueOf(bookings.get('appointment_date__c')).day()+'_'+Date.valueOf(bookings.get('appointment_date__c')).year();
                    if (!terrSupress.containsKey(thisTerr)) {
                        terrSupress.put(thisTerr, new Map<String,Integer>{thisDate => (Integer) bookings.get('total')});
                    } else if (!(terrSupress.get(thisTerr)).containsKey(thisDate)) {
                        terrSupress.get(thisTerr).put(thisDate, (Integer) bookings.get('total'));
                    }                    
                }
            }
        }
        AggregateResult[] leadbookings = [select Location__c, Appointment_Date__c, count(Id) total from Lead where Appointment_Date__c > TODAY and Status in ('BOOKED APPOINTMENT') group by Location__c, Appointment_Date__c];
        if (leadbookings.size() > 0) {
            for (AggregateResult bookings : leadbookings) {
                String thisTerr = (String) bookings.get('Location__c');
                if (thisTerr != null) {
                    thisTerr = thisTerr.replace(' ','_');
                    String thisDate = Datetime.valueOf(bookings.get('appointment_date__c') + 'T09:01:01.000Z').format('MMMM')+'_'+Date.valueOf(bookings.get('appointment_date__c')).day()+'_'+Date.valueOf(bookings.get('appointment_date__c')).year();
                    if (!terrSupress.containsKey(thisTerr)) {
                        terrSupress.put(thisTerr, new Map<String,Integer>{thisDate => (Integer) bookings.get('total')});
                    } else if (!(terrSupress.get(thisTerr)).containsKey(thisDate)) {
                        terrSupress.get(thisTerr).put(thisDate, (Integer) bookings.get('total'));
                    } else {
                        Integer addSlots = terrSupress.get(thisTerr).get(thisDate) + ((Integer) bookings.get('total'));
                        terrSupress.get(thisTerr).put(thisDate, addSlots);
                    }                    
                }
            }
        }

/*
        List<Schema.PicklistEntry> ple = Schema.getGlobalDescribe().get('lead').getDescribe().fields.getMap().get('appointment_time__c').getDescribe().getPicklistValues();
        List<Object> daySlots = new List<Object>();
        List<Object> noSlots = new List<Object>();
        // List<Object> MonSlots = new List<Object>();
        // List<Object> TueSlots = new List<Object>();
        for (Schema.PicklistEntry item : ple) {
            DateTime proxySlot = DateTime.parse(System.now().format('MM/dd/YYYY') + ', ' + item.getLabel());
            Integer timeslot = Integer.valueOf(String.valueOf(proxySlot.hour()*100 + proxySlot.minute()));
            // daySlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 4});
            noSlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 0});
            // if(timeslot == 1000) {
            //     MonSlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 0});
            //     daySlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 4});
            // } else {
            //     MonSlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 8});
            //     daySlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 6});
            // }
            // if(timeslot == 1300) {
            //     TueSlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 0});
            // } else {
            //     TueSlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 8});
            // }
            if(timeslot == 1000) {
                daySlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 10});
            } else if(timeslot == 1830) {
                daySlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 14});
            } else {
                daySlots.add(new Map<String,Integer>{'id' => timeslot, 'slots' => 12});
            }
            
        }
        Map<String,Object> SDslots = new Map<String,Object>{
            'Booked' => terrSupress.get('San_Diego'),
            'Latency' => 1,
            'Limit' => 14,
            'Sunday' => new List<Object>(noSlots.clone()),
            'Monday' => new List<Object>(daySlots.clone()),
            'Tuesday' => new List<Object>(daySlots.clone()),
            'Wednesday' => new List<Object>(daySlots.clone()),
            'Thursday' => new List<Object>(daySlots.clone()),
            'Friday' => new List<Object>(daySlots.clone()),
            'Saturday' => new List<Object>(daySlots.clone())
        };
        Map<String,Object> IEslots = new Map<String,Object>{
            'Booked' => terrSupress.get('Inland_Empire'),
            'Latency' => 1,
            'Limit' => 14,
            'Sunday' => new List<Object>(noSlots.clone()),
            'Monday' => new List<Object>(daySlots.clone()),
            'Tuesday' => new List<Object>(daySlots.clone()),
            'Wednesday' => new List<Object>(daySlots.clone()),
            'Thursday' => new List<Object>(daySlots.clone()),
            'Friday' => new List<Object>(daySlots.clone()),
            'Saturday' => new List<Object>(daySlots.clone())
        };
        Map<String,Object> OCslots = new Map<String,Object>{
            'Booked' => terrSupress.get('Orange_County'),
            'Latency' => 1,
            'Limit' => 14,
            'Sunday' => new List<Object>(noSlots.clone()),
            'Monday' => new List<Object>(daySlots.clone()),
            'Tuesday' => new List<Object>(daySlots.clone()),
            'Wednesday' => new List<Object>(daySlots.clone()),
            'Thursday' => new List<Object>(daySlots.clone()),
            'Friday' => new List<Object>(daySlots.clone()),
            'Saturday' => new List<Object>(daySlots.clone())
        };
        Map<String,Object> LVslots = new Map<String,Object>{
            'Booked' => terrSupress.get('Las_Vegas'),
            'Latency' => 1,
            'Limit' => 14,
            'Sunday' => new List<Object>(noSlots.clone()),
            'Monday' => new List<Object>(daySlots.clone()),
            'Tuesday' => new List<Object>(daySlots.clone()),
            'Wednesday' => new List<Object>(daySlots.clone()),
            'Thursday' => new List<Object>(daySlots.clone()),
            'Friday' => new List<Object>(daySlots.clone()),
            'Saturday' => new List<Object>(daySlots.clone())
        };
        Map<String,Object> DLslots = new Map<String,Object>{
            'Booked' => terrSupress.get('Dallas'),
            'Latency' => 1,
            'Limit' => 14,
            'Sunday' => new List<Object>(noSlots.clone()),
            'Monday' => new List<Object>(daySlots.clone()),
            'Tuesday' => new List<Object>(daySlots.clone()),
            'Wednesday' => new List<Object>(daySlots.clone()),
            'Thursday' => new List<Object>(daySlots.clone()),
            'Friday' => new List<Object>(daySlots.clone()),
            'Saturday' => new List<Object>(daySlots.clone())
        };*/
/*        Map<String,Object> DEslots = new Map<String,Object>{
            'Booked' => terrSupress.get('Dallas_East'),
            'Latency' => 1,
            'Limit' => 14,
            'Sunday' => new List<Object>(noSlots.clone()),
            'Monday' => new List<Object>(daySlots.clone()),
            'Tuesday' => new List<Object>(daySlots.clone()),
            'Wednesday' => new List<Object>(daySlots.clone()),
            'Thursday' => new List<Object>(daySlots.clone()),
            'Friday' => new List<Object>(daySlots.clone()),
            'Saturday' => new List<Object>(daySlots.clone())
        };
        Map<String,Object> DWslots = new Map<String,Object>{
            'Booked' => terrSupress.get('Dallas_West'),
            'Latency' => 1,
            'Limit' => 14,
            'Sunday' => new List<Object>(noSlots.clone()),
            'Monday' => new List<Object>(daySlots.clone()),
            'Tuesday' => new List<Object>(daySlots.clone()),
            'Wednesday' => new List<Object>(daySlots.clone()),
            'Thursday' => new List<Object>(daySlots.clone()),
            'Friday' => new List<Object>(daySlots.clone()),
            'Saturday' => new List<Object>(daySlots.clone())
        };
        JSONterritories.put('Dallas_East',DEslots);
        JSONterritories.put('Dallas_West',DWslots);*/
/*        JSONterritories.put('San_Diego',SDslots);
        JSONterritories.put('Inland_Empire',IEslots);
        JSONterritories.put('Orange_County',OCslots);
        JSONterritories.put('Las_Vegas',LVslots);
        JSONterritories.put('Dallas',DLslots);
*/
        Map<String,Schema.SObjectField> fieldsMap = Schema.getGlobalDescribe().get('Location').getDescribe().fields.getMap();
        List<String> customKeys = new List<String>();
        for (String field : fieldsMap.keySet()) {
            if (field.contains('__c')) {
                customKeys.add(field);
            }
        }
        String customFields = (customKeys.size()>0) ? ',' + String.join(customKeys,',') : '';
        String queryString = 'SELECT Name,TimeZone,LocationType' + customFields + ' FROM Location WHERE LocationType =\'Sales Territory\' ORDER BY CreatedDate ASC';
        Schema.Location[] locs = Database.query(queryString);

        BookingLocation[] booklocs = new List<BookingLocation>();

        if (locs.size() > 0) {
            Set<String> keys = ((Map<String, Object>)JSON.deserializeUntyped(
                JSON.serialize(new BookingLocation())
            )).keySet();
            for (Schema.Location loc : locs) {
                Map<String, Object> objLoc = new Map<String, Object>();
                for(String key: keys) {
/*                  if(key.containsAny('123456') || key=='Limit__c' || key=='Latency__c') {
                        objLoc.put(key,loc.get(key.replaceAll('_c$','__c')));
                    } else {*/
                        objLoc.put(key,loc.get(key.replaceAll('_c$','__c')));
//                  }
//                  System.debug(key+': '+loc.get(key.replaceAll('_c$','__c')));
                }
                BookingLocation bloc = (BookingLocation) JSON.deserialize(JSON.serialize(objLoc), BookingLocation.class);
                booklocs.add(bloc);
            }
        } else {
            List<String> pleSlots = new List<String>();
            List<Schema.PicklistEntry> ple = Schema.getGlobalDescribe().get('Lead').getDescribe().fields.getMap().get('Appointment_Time__c').getDescribe().getPicklistValues();
            for (Integer i=0; i<ple.size(); i++) {
                pleSlots.add(ple[i].getLabel());
            }
            BookingLocation oot = new BookingLocation();
                oot.Name = 'OUT_OF_TERRITORY';
                oot.TimeZone = 'America/New_York';
                oot.LocationType = 'Sales Territory';
                oot.Sales_Location_c = 'NO APPOINTMENTS';
                oot.Latency_c = 1;
                oot.Limit_c = 14;
                oot.Time_Slots_c = String.join(pleSlots,';');
                oot.Daily_Slot_1_c = 8;
                oot.Daily_Slot_2_c = 10;
                oot.Daily_Slot_3_c = 12;
                oot.Daily_Slot_4_c = 15;
                oot.Daily_Slot_5_c = 0;
                oot.Daily_Slot_6_c = 0;
                oot.Sunday_Time_Slots_Override_c = oot.Time_Slots_c;
                oot.Sunday_Slot_1_c = 0;
                oot.Sunday_Slot_2_c = 0;
                oot.Sunday_Slot_3_c = 0;
                oot.Sunday_Slot_4_c = 0;
                oot.Sunday_Slot_5_c = 0;
                oot.Sunday_Slot_6_c = 0;
                oot.Monday_Time_Slots_Override_c = oot.Time_Slots_c;
                oot.Monday_Slot_1_c = 0;
                oot.Monday_Slot_2_c = 12;
                oot.Monday_Slot_3_c = 14;
                oot.Monday_Slot_4_c = 19;
                oot.Monday_Slot_5_c = 0;
                oot.Monday_Slot_6_c = 0;
                oot.Tuesday_Time_Slots_Override_c = null;
                oot.Tuesday_Slot_1_c = 12;
                oot.Tuesday_Slot_2_c = 0;
                oot.Tuesday_Slot_3_c = 14;
                oot.Tuesday_Slot_4_c = 19;
                oot.Tuesday_Slot_5_c = 0;
                oot.Tuesday_Slot_6_c = 0;
                oot.Wednesday_Time_Slots_Override_c = null;
                oot.Wednesday_Slot_1_c = 0;
                oot.Wednesday_Slot_2_c = 0;
                oot.Wednesday_Slot_3_c = 0;
                oot.Wednesday_Slot_4_c = 0;
                oot.Wednesday_Slot_5_c = 0;
                oot.Wednesday_Slot_6_c = 0;
                oot.Thursday_Time_Slots_Override_c = null;
                oot.Thursday_Slot_1_c = 0;
                oot.Thursday_Slot_2_c = 0;
                oot.Thursday_Slot_3_c = 0;
                oot.Thursday_Slot_4_c = 0;
                oot.Thursday_Slot_5_c = 0;
                oot.Thursday_Slot_6_c = 0;
                oot.Friday_Time_Slots_Override_c = null;
                oot.Friday_Slot_1_c = 0;
                oot.Friday_Slot_2_c = 0;
                oot.Friday_Slot_3_c = 0;
                oot.Friday_Slot_4_c = 0;
                oot.Friday_Slot_5_c = 0;
                oot.Friday_Slot_6_c = 0;
                oot.Saturday_Time_Slots_Override_c = oot.Time_Slots_c;
                oot.Saturday_Slot_1_c = 12;
                oot.Saturday_Slot_2_c = 12;
                oot.Saturday_Slot_3_c = 12;
                oot.Saturday_Slot_4_c = 0;
                oot.Saturday_Slot_5_c = 0;
                oot.Saturday_Slot_6_c = 0;
            booklocs.add(oot);
        }
            
        if (booklocs.size() == 1) {
            BookingLocation locSet = booklocs[0].clone();
            locSet.Sales_Location_c = 'Tampa Bay';
            booklocs.add(locSet);
            // BookingLocation locSet1 = booklocs[0].clone();
            // locSet1.Sales_Location_c = 'Orange County';
            // booklocs.add(locSet1);
            // BookingLocation locSet2 = booklocs[0].clone();
            // locSet2.Sales_Location_c = 'Inland Empire';
            // booklocs.add(locSet2);
            // BookingLocation locSet3 = booklocs[0].clone();
            // locSet3.Sales_Location_c = 'Las Vegas';
            // booklocs.add(locSet3);
            // BookingLocation locSet4 = booklocs[0].clone();
            // locSet4.Sales_Location_c = 'Dallas';
            // locSet4.TimeZone = 'America/Chicago';
            // booklocs.add(locSet4);
        }

        for (BookingLocation loc : booklocs) {
//          System.debug(loc);
            String idx = loc.Sales_Location_c.replaceAll(' ','_');
            if(idx == 'NO_APPOINTMENTS') {
                idx = 'OUT_OF_TERRITORY';
            } else {
                idx = idx;
            }
            List<Object> dailySlots = new List<Object>();
            List<Object> sundaySlots = new List<Object>();
            List<Object> mondaySlots = new List<Object>();
            List<Object> tuesdaySlots = new List<Object>();
            List<Object> wednesdaySlots = new List<Object>();
            List<Object> thursdaySlots = new List<Object>();
            List<Object> fridaySlots = new List<Object>();
            List<Object> saturdaySlots = new List<Object>();
            List<Integer> slotCount = new List<Integer>{(Integer) loc.Daily_Slot_1_c,(Integer) loc.Daily_Slot_2_c,(Integer) loc.Daily_Slot_3_c,(Integer) loc.Daily_Slot_4_c,(Integer) loc.Daily_Slot_5_c,(Integer) loc.Daily_Slot_6_c};
            dailySlots = timeSlotMaker(loc.Time_Slots_c,slotCount);
            sundaySlots = (String.isEmpty(loc.Sunday_Time_Slots_Override_c)) ? dailySlots.clone() : timeSlotMaker(loc.Sunday_Time_Slots_Override_c,new List<Integer>{(Integer) loc.Sunday_Slot_1_c,(Integer) loc.Sunday_Slot_2_c,(Integer) loc.Sunday_Slot_3_c,(Integer) loc.Sunday_Slot_4_c,(Integer) loc.Sunday_Slot_5_c,(Integer) loc.Sunday_Slot_6_c});
            mondaySlots = (String.isEmpty(loc.Monday_Time_Slots_Override_c)) ? dailySlots.clone() : timeSlotMaker(loc.Monday_Time_Slots_Override_c,new List<Integer>{(Integer) loc.Monday_Slot_1_c,(Integer) loc.Monday_Slot_2_c,(Integer) loc.Monday_Slot_3_c,(Integer) loc.Monday_Slot_4_c,(Integer) loc.Monday_Slot_5_c,(Integer) loc.Monday_Slot_6_c});
            tuesdaySlots = (String.isEmpty(loc.Tuesday_Time_Slots_Override_c)) ? dailySlots.clone() : timeSlotMaker(loc.Tuesday_Time_Slots_Override_c,new List<Integer>{(Integer) loc.Tuesday_Slot_1_c,(Integer) loc.Tuesday_Slot_2_c,(Integer) loc.Tuesday_Slot_3_c,(Integer) loc.Tuesday_Slot_4_c,(Integer) loc.Tuesday_Slot_5_c,(Integer) loc.Tuesday_Slot_6_c});
            wednesdaySlots = (String.isEmpty(loc.Wednesday_Time_Slots_Override_c)) ? dailySlots.clone() : timeSlotMaker(loc.Wednesday_Time_Slots_Override_c,new List<Integer>{(Integer) loc.Wednesday_Slot_1_c,(Integer) loc.Wednesday_Slot_2_c,(Integer) loc.Wednesday_Slot_3_c,(Integer) loc.Wednesday_Slot_4_c,(Integer) loc.Wednesday_Slot_5_c,(Integer) loc.Wednesday_Slot_6_c});
            thursdaySlots = (String.isEmpty(loc.Thursday_Time_Slots_Override_c)) ? dailySlots.clone() : timeSlotMaker(loc.Thursday_Time_Slots_Override_c,new List<Integer>{(Integer) loc.Thursday_Slot_1_c,(Integer) loc.Thursday_Slot_2_c,(Integer) loc.Thursday_Slot_3_c,(Integer) loc.Thursday_Slot_4_c,(Integer) loc.Thursday_Slot_5_c,(Integer) loc.Thursday_Slot_6_c});
            fridaySlots = (String.isEmpty(loc.Friday_Time_Slots_Override_c)) ? dailySlots.clone() : timeSlotMaker(loc.Friday_Time_Slots_Override_c,new List<Integer>{(Integer) loc.Friday_Slot_1_c,(Integer) loc.Friday_Slot_2_c,(Integer) loc.Friday_Slot_3_c,(Integer) loc.Friday_Slot_4_c,(Integer) loc.Friday_Slot_5_c,(Integer) loc.Friday_Slot_6_c});
            saturdaySlots = (String.isEmpty(loc.Saturday_Time_Slots_Override_c)) ? dailySlots.clone() : timeSlotMaker(loc.Saturday_Time_Slots_Override_c,new List<Integer>{(Integer) loc.Saturday_Slot_1_c,(Integer) loc.Saturday_Slot_2_c,(Integer) loc.Saturday_Slot_3_c,(Integer) loc.Saturday_Slot_4_c,(Integer) loc.Saturday_Slot_5_c,(Integer) loc.Saturday_Slot_6_c});
            Map<String,Object> slots = new Map<String,Object>{
                'Booked' => terrSupress.get(idx),
                'Latency' => loc.Latency_c,
                'Limit' => loc.Limit_c,
                'Sunday' => sundaySlots,
                'Monday' => mondaySlots,
                'Tuesday' => tuesdaySlots,
                'Wednesday' => wednesdaySlots,
                'Thursday' => thursdaySlots,
                'Friday' => fridaySlots,
                'Saturday' => saturdaySlots
            };
          System.debug(idx + ': ' + slots);
            JSONterritories.put(idx,slots);
            JSONterritories.put('Supress',suppress);
        }
        
        sched = JSON.serialize(JSONterritories);
//      System.debug(sched);
    }
    
    public List<Object> timeSlotMaker(String strSlots,List<Integer> slotCount) {
        List<String> arrSlots = strSlots.split(';');
        List<Object> daySlot = new List<Object>();
        Integer i = 0;
        for (String slot : arrSlots) {
            DateTime proxySlot = DateTime.parse(System.now().format('MM/dd/YYYY') + ', ' + slot);
            Integer timeslot = Integer.valueOf(String.valueOf(proxySlot.hour()*100 + proxySlot.minute()));
            daySlot.add(new Map<String,Integer>{'id' => timeslot, 'slots' => slotCount[i]});
            i++;
        }
//        System.debug(daySlot);
        return daySlot;
    }
    
    public PageReference setLocate() {
        PageReference pageRef = apexpages.currentPage();//new PageReference('/apex/ThankYouPage');
        Map<String,String> pageRefParameters = pageRef.getParameters();
        for (String keyName : pageRefParameters.keySet()) {
            pageRef.getParameters().put(keyName,(String) pageRefParameters.get(keyName));
        }
        if(cu_id == null && ApexPages.CurrentPage().getparameters().get('locate') == null) {
            pageRef.getParameters().put('locate', '');
            pageRef.setRedirect(true);
            return pageRef;
        }
        return null;
    }
    
    public PageReference doSubmit(){

        PageReference pageRef = (Apexpages.currentPage().getParameters().get('redirectTo') != null) ? new PageReference(Apexpages.currentPage().getParameters().get('redirectTo')) : new PageReference('/apex/ThankYouPage');
        String refSite = (isPavers) ? 'Pavers' : 'Turf';
        pageRef.getParameters().put('ref', refSite);
        pageRef.setRedirect(true); 
        
        //Convert back wrapper into Account
            Lead l = new Lead();
            l.FirstName = (leadw.cu_FirstName != null) ? leadw.cu_FirstName : 'BlankFirst';
            l.LastName = (leadw.cu_LastName != null)? leadw.cu_LastName : 'BlankLast';
            if (leadw.cu_Email != null) l.Email = leadw.cu_Email;
            if (leadw.cu_PhoneNumber != null) l.MobilePhone = leadw.cu_PhoneNumber;
            l.Booked_From_VF_Page__c = true;
            l.Booked_From_VF_Page_TimeStamp__c =System.now();
            if (leadw.cu_postalcode != null) l.postalcode = leadw.cu_postalcode;
            if (leadw.cu_city != null) l.City = leadw.cu_city;
            if (leadw.cu_street != null) l.Street = leadw.cu_street;
        	if (leadw.cu_territory != 'OUT OF TERRITORY') l.Location__c = leadw.cu_territory;
            l.Appointment_Date__c = date.parse(string.valueOf(leadw.cu_appointmentDate));
            l.Appointment_Time__c = (leadw.cu_appointmentTime != null)? leadw.cu_appointmentTime : '';
            l.Product_Interest__c = (leadw.cu_serviceType != null)? leadw.cu_serviceType : 'Turf';
            if (leadw.cu_isAffirmedConsent != null && leadw.cu_isAffirmedConsent == 'true') { l.Marketing_Email_OK__c = true; }
            l.Status = 'BOOKED APPOINTMENT';
        	if (leadw.cu_howfind != null) l.How_Did_You_Hear_About_Us__c = leadw.cu_howfind;
        
        if (cu_id != null && cu_id != 'None' && cu_id != 'Conv') {
            l.Id = cu_id;
        } else {
            if (lead_source != null ) l.LeadSource = lead_source;
            l.Source__c = Apexpages.currentPage().getParameters().get('form_url');
            l.Company = l.FirstName + ' ' + l.LastName;
        }
        upsert l;
        
        if (leadw.cu_territory == 'OUT OF TERRITORY') pageRef.getParameters().put('terr', 'oot');

        return pageRef;
    }
}