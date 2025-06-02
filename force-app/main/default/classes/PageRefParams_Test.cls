/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 04-27-2023
 * @last modified by  : Bradford Mar
**/
@isTest (seealldata= false)
public class PageRefParams_Test {

    public static testMethod void method1() 
    {
        test.startTest();
        PageRefParams a = new PageRefParams();
        a.isPavers = true;
        a.isOOT = true;
        test.stopTest();
    }
}
