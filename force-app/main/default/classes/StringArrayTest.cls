public class StringArrayTest {
    
    //Metodo statico che restituisce Lista di Stringhe
    //la lunnghezza è determinata da un parametro intero
    
    public static List<String> generateStringArray(Integer n)
        
    {
        //Instanziare una lista
        List<String> myArray = new List<String>();
        
        //iterazione tramite ciclo For per creare una lista
        for(Integer i=0;i<n;i++)
            
        {
            //aggiungi elemento alla lista
            myArray.add('Test '+i);
            
            // visualizza in debug
            System.debug(myArray[i]);
            
        }
        
        //restituisce una lista
        return myArray;
    
    }
    
    
}