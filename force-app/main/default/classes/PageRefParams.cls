/**
 * @description       : 
 * @author            : Bradford Mar
 * @group             : 
 * @last modified on  : 05-08-2023
 * @last modified by  : Bradford Mar
**/
public Without Sharing class PageRefParams {
    public Boolean isPavers{get;set;}
    public Boolean isOOT{get;set;}
    public PageRefParams() {
        isPavers = (ApexPages.currentPage().getParameters().get('ref') == 'Pavers') ? true : false;
        isOOT = (ApexPages.currentPage().getParameters().get('terr') != null && ApexPages.currentPage().getParameters().get('terr') == 'oot') ? true : false;
    }
}