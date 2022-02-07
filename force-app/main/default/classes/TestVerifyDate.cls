@isTest
public class TestVerifyDate {
    @isTest static void checkWithin30DaysTest(){
        Date varDate = Date.newInstance(2022,01,25);
        Date varDate1 = Date.newInstance(2022,01,28);
        Date dt = VerifyDate.CheckDates(varDate,varDate1);
		System.assertEquals(dt, varDate1);
        Date varDate3 = Date.newInstance(2022,10,28);
        Date dt1 = VerifyDate.CheckDates(varDate,varDate3);
        Date varDate4 = Date.newInstance(2022,01,31);
       System.assertEquals(dt1, varDate4);
        
    }
}