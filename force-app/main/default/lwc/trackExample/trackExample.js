import { LightningElement, track } from 'lwc';

export default class TrackExample extends LightningElement {
    @track person = {
        Id:1,
        Name:'Ali',
        Age:8
    }
    updateName(event){
        this.person.Name=event.target.value;
    }       
}