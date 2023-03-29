public class AccountHandler {
  
    //metodo per inserire nuovo account partendo da una Stringa nome
    public Static Account insertNewAccount(String n){
        //instanziare account
        Account acc=new Account(name=n);
        
        //Gestione errore stringa vuota
        
        try{
                insert acc;
                return acc;
            }
        
        //in caso di errore mi ritorna null
        
        catch(DMLException e){
            return null;

        }
    }
 


    
    
}