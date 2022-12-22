trigger OppTrigger on Opportunity (before insert,before Update) {
        if(trigger.isbefore){
        if(trigger.isInsert ||(trigger.isUpdate)){
                 for(Opportunity o:trigger.new){
                 if(o.StageName=='Prospecting'){
                    o.Amount=100;
                }else if(o.StageName=='Qualification'){
                    o.Amount=200;
                }else if(o.StageName=='Need Analysis'){
                    o.Amount=300;                    
                }else if(o.StageName=='Value Proposition'){
                    o.Amount=400;
                }else if(o.StageName=='Id. Decision Makers'){
                    o.Amount=500;                    
                }else if(o.StageName=='Perception Analysis'){
                    o.Amount=600;  
                }else if(o.StageName=='Proposal/Price quote'){
                    o.Amount=700;
                }else if(o.StageName=='Negotiation/Review'){
                    o.Amount=800;
                }else if(o.StageName=='Closed Won'){
                    o.Amount=900;                    
                }else if (o.StageName=='closed Lost'){
                    o.Amount=1000;
                }else{
                    o.Amount=0;
                }
              }                      
            }
      }

    }