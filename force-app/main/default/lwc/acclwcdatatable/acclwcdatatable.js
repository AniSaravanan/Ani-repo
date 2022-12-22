import { LightningElement,wire } from 'lwc';
import getAcc from '@salesforce/apex/AccountCmp.getAccount';
import deleteAcc from '@salesforce/apex/AccountCmp.deleteAcc';

export default class acclwcdatatable extends LightningElement {
    actions = [
        { label: 'Show details', name: 'show_details' },
        { label: 'Delete', name: 'delete' }
    ];
    columns= [
        {label: 'Account Name', fieldName: 'Name', type: 'text'},
        {label: 'Account Type', fieldName: 'Type', type: 'text'},
        {label: 'Account Site', fieldName: 'Site', type: 'url', typeAttributes: { target: '_self'}},
        {label: 'Account Rating', fieldName: 'Rating', type: 'text'},
        {label: 'Account Phone', fieldName: 'Phone', type: 'phone'},
        { type: 'action', typeAttributes: { rowActions: this.actions } }
    ];
    /*@wire(getAcc)
    accountDetails;*/
    accList;
    /*@wire(getAcc)
    accountDetails({error,data}){
        if(data){
            this.accList = data;
        }else if(error){
            console.log(error);
        }
    }*/
    /*@wire(getAcc,{accName1:'$accName',phone : '$accPhone'})
    accountdata;*/
    connectedCallback(){
        //getAcc("apex class parameter1":"local attribute","apex class parameter2":"local attribute")
         /*getAcc()
        .then(result => {
            this.accList = result;
            
        })
        .catch(error => {
            console.error('** error ** \n ',error);
        })*/
        this.getAccLst();
    }
    getAccLst(event){
        getAcc()
        .then(result => {
            this.accList = result;
            
        })
        .catch(error => {
            console.error('** error ** \n ',error);
        })
    }
    handleRowAction(event){
        var action = event.detail.action.name;
        var row = event.detail.row;
        switch (action) {
            case 'show_details':
                alert('Showing Details: ' + JSON.stringify(row));
                break;
            case 'delete':
                alert('delete');
               // helper.deleteAcc(component,row.Id);
               this.deleteAccount(row.Id,row.Name);
                break;
        }
    }
    deleteAccount(rowid,accName){
        deleteAcc({accId:rowid,accName:accName})
        .then(result => {
            this.accList = result;
            const evt = new ShowToastEvent({
                title: 'Success',
                message: 'Record Deleted Successfully',
                variant: 'success',
            });
            this.dispatchEvent(evt); 
            
        })
        .catch(error => {
            console.error('** error ** \n ',error);
        })
    }
}