import { api, LightningElement, track, wire } from 'lwc';
import convert from '@salesforce/apex/CurrencyConverterService.convert';
import getSymbols from '@salesforce/apex/CurrencyConverterService.getSymbols';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import { createRecord } from 'lightning/uiRecordApi';

export default class CurrencyConverter extends LightningElement {

    sourceCurrency = '';
    targetCurrency = '';
    @track amount = '';
    @track convertedAmount;
    @track rate;
    DisplayText = false;
    symbols = [{}];

    @wire(getSymbols, {})
    element({ error, data }) {
        let key = [];
        let val = [];
        if (error) {
            alert('wire method hatali')
        } else if (data) {
            key.push(Object.keys(data))
            val.push(Object.values(data))
            for (let i = 0; i < key[0].length; i++) {
                this.symbols.push({

                    value: (key[0])[i],
                    label: (val[0])[i]

                })
            }
        }

    }

    get options() {

        return this.symbols;

    }

    @api LWCFunction() {
        if (this.DisplayText != true) {
            this.DisplayText = true;
        }
    }


    cancel() {
        if (this.DisplayText != false) {
            this.DisplayText = false;
        }
    }

    handleAmountChange(event) {
        this.amount = event.detail.value;

        if (this.rate != null) {
            this.convertedAmount = this.amount * this.rate;
        }

    }

    handleSourceChange(event) {
        this.sourceCurrency = event.detail.value;
        if (this.targetCurrency != '') {
            convert({
                sourceCurrency: this.sourceCurrency,
                targetCurrency: this.targetCurrency,
                amount: 1
            }).then(result => {
                this.rate = result / 1;
                this.convertedAmount = this.amount * this.rate;
            });
        }
    }

    handleTargetChange(event) {
        this.targetCurrency = event.detail.value;
        if (this.sourceCurrency != '') {
            convert({
                sourceCurrency: this.sourceCurrency,
                targetCurrency: this.targetCurrency,
                amount: 1
            }).then(result => {
                this.rate = result / 1;
                this.convertedAmount = this.amount * this.rate;
            });
        }
    }

    handleAmountChange(event) {
        this.amount = event.detail.value;

        if (this.rate != null) {
            this.convertedAmount = this.amount * this.rate;
        }

    }

    createExchange() {
        var fields = {
            'Sell_Currency__c': this.sourceCurrency,
            'Sell_Amount__c': this.amount,
            'Buy_Currency__c': this.targetCurrency,
            'Buy_Amount__c': this.convertedAmount,
            'Rate__c': this.rate,
            'Date_Booked__c': new Date()
        };

        let isValid = true;
        let inputFields = this.template.querySelectorAll('.validate');
        inputFields.forEach(inputField => {
            if (!inputField.checkValidity()) {
                inputField.reportValidity();
                isValid = false;
            }
        });
        if (isValid!=false) {
            // Record details to pass to create method with api name of Object.
            var objRecordInput = { 'apiName': 'Foreign_Exchange_Trades__c', fields };
            // LDS method to create record.
            createRecord(objRecordInput).then(response => {
                alert('Foreign Exchange Trades is Created: ' + response.id);

                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'Foreign Exchange Trades is Created: ' + response.id,
                    variant: 'success'
                }));

                const myevent = new CustomEvent('needToRefreshTable');
                this.dispatchEvent(myevent);
            }).catch(error => {
                alert('Error: ' + JSON.stringify(error));
            });
        }else{
            alert('Zorunlu alanlari doldurunuz')
        }

        
    }
}