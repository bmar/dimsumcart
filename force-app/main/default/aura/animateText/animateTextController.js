({
    init: function (cmp, evt, hlpr) {
        cmp.set('v.CSR','');
        if (cmp.get('v.leadRecord.Customer_Satisfaction_Rating__c') != "" && cmp.get('v.leadRecord.Customer_Satisfaction_Rating__c') != null) {
            let className = '';
            switch (cmp.get('v.leadRecord.Customer_Satisfaction_Rating__c').substring(0,3)) {
                case 'GRE':
                    className = 'green';
                    break;
                case 'BLU':
                    className = 'blue';
                    break;
                case 'YEL':
                    className = 'yellow';
                    break;
                case 'ORA':
                    className = 'orange';
                    break;
                case 'RED':
                    className = 'red';
                    break;
                default:
                    className = 'green';
                    break;
            }
            cmp.set('v.CSR',className + ' slds-tabs_card');
        };
    }
})
