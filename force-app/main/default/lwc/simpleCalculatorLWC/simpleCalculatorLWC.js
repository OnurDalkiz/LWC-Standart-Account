import { LightningElement, track } from 'lwc';

export default class SimpleCalculatorLWC extends LightningElement {

    firstNumber=0;
    secondNumber=0;
    result;
    @track previousValue=[];
    check=false;

    //Not Recommended
/*     handleChange1(event){
        this.firstNumber=event.target.value;
    }
    handleChange2(event){
        this.secondNumber=event.target.value;
    } */
    //Best Practise
    handleChange(event){
        if (event.target.name ==='fNumber') {
            this.firstNumber=event.target.value;
        }else if(event.target.name ==='sNumber'){
            this.secondNumber=event.target.value;
        }

    }
    handleAdd(){
        this.previousValue.push(this.result);
        this.result=Number(this.firstNumber)+Number(this.secondNumber);
    }
    handleSubtract(){
        this.previousValue.push(this.result);
        this.result=Number(this.firstNumber)-Number(this.secondNumber);
      }
    handleMultiply(){
        this.previousValue.push(this.result);
        this.result=Number(this.firstNumber)*Number(this.secondNumber);
    }
    handleDivide(){
        this.previousValue.push(this.result);
        this.result=Number(this.firstNumber)/Number(this.secondNumber);       
    }
    handleCheckbox(event){
        this.check=event.target.checked;
    }
}