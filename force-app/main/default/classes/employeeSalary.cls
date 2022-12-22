public class employeeSalary {
     
    
    public void salaryrange(Integer Exp,String title){
        system.debug('Employee Experience:'+Exp);
        system.debug('Emlpyee Tile:'+title);
        if(Exp==3&&title=='Software Engineer'){
            system.debug('Employee Salary:60k-70k');
        }if(Exp>= 4 && Exp <=5 &&title=='Software Engineer'){
                system.debug('Employee Salary:60k-80k');
            } else if(Exp==3 &&title=='Senior Software Engineer'){
                system.debug('Employee Salary:70k-80k');
            }else if(Exp>= 4 && Exp <=5 &&title=='Senior Software Engineer'){
                system.debug('Employee Salary:70k-90k');
            }else if(Exp==5 &&title=='Team Lead'){
                        system.debug('Employee Salary:80k-90k');
                            }
        else if(Exp>= 5 && Exp <=7 &&title=='Team Lead'){
                system.debug('Employee Salary:80k-100k');
                
                            }
    
         
                                     
            
    }
    
    
}