public with sharing class ConvertTimeZone {
    @InvocableMethod(label='Convert Timezone' description='Returns a datetime adjusted to the target timezone')
    public static List<DateTime> getTimezoneAdjusted(List<TimeZoneRequest> requests) {
        List<DateTime> results = new List<DateTime>();
        for (TimeZoneRequest request : requests) {
            {
                TimeZone tz = Timezone.getTimeZone(request.sourceTimezone);
                Integer offset=tz.getOffset(request.dttime);
                
                // target Timezone.
                TimeZone targetTZ = Timezone.getTimeZone(request.targetTimezone);
                integer offsetTotargetTZ = targetTZ.getOffset(request.dttime);
                integer correction = offsetTotargetTZ- offset;
                
                DateTime targetDT = request.dttime.addMinutes(correction / (1000 * 60));
                
                results.add(DateTime.newInstance(targetDT.year(),targetDT.month(),targetDT.day(),targetDT.hour(), targetDT.minute(), targetDT.second()));
            }
        }
        return results;
    }
    
    /* Input parameters for the Apex action */
    public class TimeZoneRequest {
        @invocableVariable(label='Date/Time value')
        public DateTime dttime;

        @invocableVariable(label='Target Timezone value (e.g. "America/Phoenix")')
        public String targetTimezone;

        @invocableVariable(label='Source Timezone value (e.g. "America/Los_Angeles")')
        public String sourceTimezone;
    }
}