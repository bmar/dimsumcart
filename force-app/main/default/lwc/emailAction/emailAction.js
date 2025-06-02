import { LightningElement, api } from 'lwc';

import { NavigationMixin } from 'lightning/navigation';

import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';

export default class EmailQuickAction2 extends NavigationMixin(LightningElement) {
    @api email;
    @api subject;
    @api thisid;

    handleClick(e) {
        e.preventDefault();
        var pageRef = {
            type: "standard__quickAction",
            attributes: {
                apiName: "Global.SendEmail"
            },
            state: {
                recordId: this.thisid,
                defaultFieldValues:
                encodeDefaultFieldValues({
                    // HtmlBody : "Pre-populated text for the email body.", 
                    Subject : this.subject
                })
            }
        };

        this[NavigationMixin.Navigate](pageRef);
    }
}