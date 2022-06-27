import { LightningElement, wire } from 'lwc';
import getAccount from '@salesforce/apex/AccountController.getAccount'

export default class GetAccountLWC extends LightningElement {

    filterWord='';
                                                    //$filterWord kelimesinde ki dolar isareti property i dinamik
                                                    //hale getirir. Dinamik demek data degistiginde otomatik olarak
                                                    //yansitiliyor demektir.

    @wire(getAccount, {filter:'$filterWord'}) account;//filter kelimesi Apex methodunun parametre adi olmalidir.

    handleInput(event){

        this.filterWord = event.target.value;

    }
}