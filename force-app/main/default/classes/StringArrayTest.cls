public class StringArrayTest {
	
    public static List<String> generateStringArray(Integer numOfRecReturn){
        List<String> arrayData = new List<String>();
        for(Integer i=0; i<numOfRecReturn; i++){
            arrayData.add('Test '+i);
            
        }
        return arrayData;
    }
}