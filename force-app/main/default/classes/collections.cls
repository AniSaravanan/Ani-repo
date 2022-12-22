public class collections {
   public List<Integer> grp1;
   public List<Integer> grp2;
   Public List<Integer> grp3;
    public collections(){
      grp1=new List<Integer>(); 
      grp2=new List<Integer>(); 
      grp3=new List<Integer>();
        grp1.add(100);
        grp1.add(200);
        grp1.add(300);            
      list<Integer>grp2=new List<Integer>(grp1);
        system.debug(grp2);
        grp1.add(400);
     Integer myNumber = grp1.get(0);
     system.assertEquals(100, myNumber);
        
        
        
        
        
    } 
        
    

}