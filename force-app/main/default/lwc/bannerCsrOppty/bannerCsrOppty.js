import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import CSR from '@salesforce/schema/Opportunity.Account.Customer_Satisfaction_Rating__c';

const fields = [CSR];

export default class BannerCsrOppty extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields })
    account;

    get csr() {
        return getFieldValue(this.account.data, CSR);
    }
    get styleCSR() {
        let check = getFieldValue(this.account.data, CSR);
        let className = '';
        if (check != "" && check != null) {
            switch (check.substring(0,3)) {
                case 'GRE':
                    className = 'green slds-tabs_card ';
                    break;
                case 'BLU':
                    className = 'blue slds-tabs_card ';
                    break;
                case 'YEL':
                    className = 'yellow slds-tabs_card ';
                    break;
                case 'ORA':
                    className = 'orange slds-tabs_card ';
                    break;
                case 'RED':
                    className = 'red slds-tabs_card ';
                    break;
                default:
                    className = '';
                    break;
            }
        }
        return className + 'bannerCSR';
    }
}