public class Prova {
     
    
     public static String updateJSONMap(String j, String s, String c){
        Map<String, Map<String, Map<String, Integer>>> m = (Map<String, Map<String, Map<String, Integer>>>)JSON.deserialize(j, Map<String, Map<String, Map<String, Integer>>>.class);
        Integer partial = (Integer) m.get(s).get(c).get('partial');
        if (partial == m.get(s).get(c).get('total')){
            return JSON.serialize(m);
        } else{
            m.get(s).get(c).put('partial', partial + 1);
            return JSON.serialize(m);
        }
    }

    /**
     * @author: AM
     * @date: 21/01/2021
     * @description: Metodo che controlla se rispetto alla mappa JSON degli step e delle condizioni un'offerta è completa
     * @param j Mappa JSON da controllare
     * @return Boolean
     */
    public static Boolean checkOfferComplete(String j){
        Boolean resultCondGlobal = true;
        Map<String, Map<String, Map<String, Integer>>> m = (Map<String, Map<String, Map<String, Integer>>>)JSON.deserialize(j, Map<String, Map<String, Map<String, Integer>>>.class);
        for (String s : m.keySet()){
            Boolean resultCond = false;
            for (String c : m.get(s).keySet()){
                if (m.get(s).get(c).get('partial') == m.get(s).get(c).get('total')){
                    resultCond = true;
                    break;
                }
            }
            if (!resultCond){
                resultCondGlobal = false;
                break;
            }
        }
        return resultCondGlobal;
    }

    /**
     * @author: AM
     * @date: 05/03/2021
     * @description: Metodo che controlla se la condizione della Customer Offer è verificato
     * @param jsonMap Mappa JSON da controllare
     * @param condition Condizione da verificare
     * @param step Step della Condizione
     * @return Boolean
     */
    public static Boolean checkConditionComplete(String jsonMap, String condition, String step){
        Map<String, Map<String, Map<String, Integer>>> m = (Map<String, Map<String, Map<String, Integer>>>)JSON.deserialize(jsonMap, Map<String, Map<String, Map<String, Integer>>>.class);

        if (m.get(step).get(condition).get('partial') == m.get(step).get(condition).get('total')){
            return true;
        } else{
            return false;
        }
    }

    /**
     * @author: AM
     * @date: 09/03/2021
     * @description: Metodo che controlla se la condizione della Customer Offer è verificato
     * @param jsonMap Mappa JSON da controllare
     * @return Boolean
     */
    public static Integer getIWPartecipation(String jsonMap){
        Map<String, Map<String, Map<String, Integer>>> m = (Map<String, Map<String, Map<String, Integer>>>)JSON.deserialize(jsonMap, Map<String, Map<String, Map<String, Integer>>>.class);
        Integer IWpartecipation = 0;
        for (String s : m.keySet()){
            for (String c : m.get(s).keySet()){
                if (m.get(s).get(c).get('partial') == m.get(s).get(c).get('total')){
                    IWpartecipation += (Integer) m.get(s).get(c).get('IW');
                }
            }
        }
        return IWpartecipation;
    }

  
    
   
    
}