/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-08-2023
 * @last modified by  : Bradford Mar
**/
public Without Sharing class PageRefParams {
    public Boolean isKitchen{get;set;}
    public Boolean isOOT{get;set;}
    public PageRefParams() {
        isKitchen = (ApexPages.currentPage().getParameters().get('ref') == 'Kitchen') ? true : false;
        isOOT = (ApexPages.currentPage().getParameters().get('terr') != null && ApexPages.currentPage().getParameters().get('terr') == 'oot') ? true : false;
    }
}