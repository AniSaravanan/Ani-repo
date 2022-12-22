import { LightningElement } from 'lwc';

export default class Databinding extends LightningElement {
    fname= '';
    lname= '';
    handlechange(event) {
        const targetName = event.target.name;
        if(targetName=='firstname'){
            this.fname = event.target.value;

        } 

    else if(targetName=='lastname'){
        this.lname = event.target.value;
    }
   
    }     
    get uppercasedFullname(){
        //console.log('this.fname:'+this.fname);
        //console.log('this.lname:'+this.lname);

        return(this.fname+' '+this.lname).toUpperCase();
    }
    handleClick(event){
        const messageEvent = new customEvent('childmessage',{detail:'this.fname'});
                    this.dispatchEvent(messageEvent);
    }
}