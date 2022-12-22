import { LightningElement } from 'lwc';

export default class Testcomp extends LightningElement {
    message='welcome to LWC';
    handleMessage(event){
        this.message = event.detail;
    }
}