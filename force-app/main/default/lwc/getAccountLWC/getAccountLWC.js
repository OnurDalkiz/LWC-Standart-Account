import { LightningElement/* , wire */} from 'lwc';
import getAcc from '@salesforce/apex/AccountController.getAccount'

export default class GetAccountLWC extends LightningElement {

    filterWord='';
    accounts;
    error;
                                                    //$filterWord kelimesinde ki dolar isareti property i dinamik
                                                    //hale getirir. Dinamik demek data degistiginde otomatik olarak
                                                    //yansitiliyor demektir.
                                                

    //@wire(getAcc, {filter:'$filterWord'}) accounts;//filter kelimesi Apex methodunun parametre adi olmalidir.
    //{accounts} icerisinde data ve error diye iki veriyi barindirir.
    //accounts.data ve accounts.error olarak kullaniriz. Data ve errordan ikisinden birisi doludur.
    
    handleInput(event){
        this.filterWord = event.target.value;
    }
    handleGetAccount(){
        getAcc({filter:this.filterWord})
        .then((result) =>{
            this.accounts=result;
            this.error=undefined;
        })
        .catch((error) => {
            this.error=error;
            this.accounts=undefined;
        });
    }
}