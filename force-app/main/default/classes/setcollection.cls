public class setcollection {
   public set<Integer> group1;
   public set<Integer> group2;
    public setcollection(){
        group1=new set<Integer>();
        group2=new set<Integer>();
        group1.add(100);
        group1.add(200);
        group1.add(300);
        group2.add(400);
        group2.add(500);
        system.debug(group1);
        system.debug(group2);
        group1.addAll(group2);
      
        //adding duplicate value        
        group1.add(100);
        system.debug(group1);   
        
        //check if certain value exist
          system.debug(group1.contains(100));
          system.debug(group1.contains(400));  
        
        //Delete an element        
        system.debug(group1.remove(200));  
        
        //check the size
        system.debug(group1.size());
        
        //check set is empty
        system.debug(group1.isEmpty());
        
    }
    

}