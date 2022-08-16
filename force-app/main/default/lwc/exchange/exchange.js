

import { api, LightningElement, track, wire } from 'lwc';
import convert from '@salesforce/apex/CurrencyConverterService.convert';
import { createRecord } from 'lightning/uiRecordApi';

export default class CurrencyConverter extends LightningElement {


    sourceCurrency = 'USD';
    targetCurrency = 'GBP';
    amount = '';
    @track convertedAmount;
    @track rate;
    symbols={};

    DisplayText = false;
    @api LWCFunction() {
        if (this.DisplayText != true) {
            this.DisplayText = true;
        } else {
            this.DisplayText = false;
        }
    }        

    get options() {
        return [
            { label: 'US Dollar', value: 'USD' },
            { label: 'Great Britian Pound', value: 'GBP' },
            { label: 'Indian Rupee', value: 'INR' }
        ];
    }

    handleSourceChange(event) {
        this.sourceCurrency = event.detail.value;
    }

    handleTargetChange(event) {
        this.targetCurrency = event.detail.value; 
    }

    handleAmountChange(event) {
        this.amount = event.detail.value;
    }

    handleConvert(event) {
        convert({
            sourceCurrency: this.sourceCurrency,
            targetCurrency: this.targetCurrency,
            amount: this.amount
        }).then(result => {
            this.convertedAmount = result; 
            this.rate = result / this.amount;
        });
    }
    
    handleRenderer(){
        alert('Dikkat')
    }

    createAccount() { 
        var fields = {
            'Sell_Currency__c': this.sourceCurrency,
            'Sell_Amount__c': this.amount,
            'Buy_Currency__c': this.targetCurrency,
            'Buy_Amount__c': this.convertedAmount,
            'Rate__c': this.rate,
            'Date_Booked__c': new Date()
        };       
        // Record details to pass to create method with api name of Object.
        var objRecordInput = { 'apiName': 'Foreign_Exchange_Trades__c', fields };
        // LDS method to create record.
        createRecord(objRecordInput).then(response => {
            alert('Foreign Exchange Trades: ' + response.id);
        }).catch(error => {
            alert('Error: ' + JSON.stringify(error));
        });
    }

}