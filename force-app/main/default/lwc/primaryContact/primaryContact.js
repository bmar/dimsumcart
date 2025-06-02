import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import ID from '@salesforce/schema/Opportunity.Contact__c';
import NAME from '@salesforce/schema/Opportunity.Contact__r.Name';
import PHONE from '@salesforce/schema/Opportunity.Contact__r.Phone';
import MOBILE from '@salesforce/schema/Opportunity.Contact__r.MobilePhone';
import EMAIL from '@salesforce/schema/Opportunity.Contact__r.Email';
import STREET from '@salesforce/schema/Opportunity.Account.ShippingStreet';
import CITY from '@salesforce/schema/Opportunity.Account.ShippingCity';
import STATE from '@salesforce/schema/Opportunity.Account.ShippingState';
import ZIP from '@salesforce/schema/Opportunity.Account.ShippingPostalCode';
import VIP from '@salesforce/schema/Opportunity.Contact__r.VIP_Status__c';
import OPPNAME from '@salesforce/schema/Opportunity.Name';
import TYPE from '@salesforce/schema/Opportunity.Opportunity_Type__c';

const fields = [ID,NAME,PHONE,MOBILE,EMAIL,STREET,CITY,STATE,ZIP,VIP,OPPNAME,TYPE];//

export default class PrimaryContact extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    opportunity

    get id() {
        return window.location.href.replace(/[?#].+$/,'').replace(/\/[^\/]+\/[^\/]+\/[^\/]+$/,'/') + 'contact/' + getFieldValue(this.opportunity.data, ID) + '/view';
    }
    get name() {
        return getFieldValue(this.opportunity.data, NAME);
    }
    get phone() {
        // if (getFieldValue(this.opportunity.data, MOBILE) != '') {
        //     return getFieldValue(this.opportunity.data, MOBILE);
        // } else {
        // if(this.opportunity.data.fields.Contact__r.value.fields.Phone != undefined) {
            return getFieldValue(this.opportunity.data, PHONE);
        // } else {
        //     return '';
        // }
    }
    get mobile() {
            return getFieldValue(this.opportunity.data, MOBILE);
    }
    get email() {
        return getFieldValue(this.opportunity.data, EMAIL);
    }
    get street() {
        return getFieldValue(this.opportunity.data, STREET);
    }
    get city() {
        return getFieldValue(this.opportunity.data, CITY);
    }
    get state() {
        return getFieldValue(this.opportunity.data, STATE);
    }
    get zip() {
        return getFieldValue(this.opportunity.data, ZIP);
    }
    get vip() {
        return getFieldValue(this.opportunity.data, VIP);
    }
    get subject() {
        let subj = getFieldValue(this.opportunity.data, OPPNAME) + ' ' + getFieldValue(this.opportunity.data, TYPE);
        return subj;
    }
}