import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import ID from '@salesforce/schema/Opportunity.Contact__c';
import NAME from '@salesforce/schema/Opportunity.Contact__r.Name';
import EMAIL from '@salesforce/schema/Opportunity.Contact__r.Email';
import STREET from '@salesforce/schema/Opportunity.Account.ShippingStreet';
import CITY from '@salesforce/schema/Opportunity.Account.ShippingCity';
import STATE from '@salesforce/schema/Opportunity.Account.ShippingState';
import ZIP from '@salesforce/schema/Opportunity.Account.ShippingPostalCode';
import VIP from '@salesforce/schema/Opportunity.Contact__r.VIP_Status__c';

const fields = [ID,NAME,EMAIL,STREET,CITY,STATE,ZIP,VIP];//

export default class PrimaryContactPartner extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    opportunity

    get id() {
        return window.location.href.replace(/[?#].+$/,'').replace(/\/[^\/]+\/[^\/]+\/[^\/]+$/,'/') + 'contact/' + getFieldValue(this.opportunity.data, ID) + '/view';
    }
    get name() {
        return getFieldValue(this.opportunity.data, NAME);
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
}