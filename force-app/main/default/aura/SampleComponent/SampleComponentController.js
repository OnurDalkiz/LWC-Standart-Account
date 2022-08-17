({
    doInit: function (component, event, helper) {
        component.set('v.columns', [
            { label: 'Id', fieldName: 'Name', type: 'text'},
            { label: 'Sell Currency', fieldName: 'Sell_Currency__c', type: 'text'},
            { label: 'Sell Amount', fieldName: 'Sell_Amount__c', type: 'currency'},
            { label: 'Buy Currency', fieldName: 'Buy_Currency__c', type: 'text'},
            { label: 'Buy Amount', fieldName: 'Buy_Amount__c', type: 'currency'},
            { label: 'Rate', fieldName: 'Rate__c', type: 'number' },
            { label: 'Date Booked', fieldName: 'Date_Booked__c', type: 'datetime-local'},
        ]);
        helper.fetchData(component, event, helper);
    },

    handleClick: function (component, event, helper) {
        component.find('exchange').LWCFunction();
    }  
})