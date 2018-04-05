@isTest
public class TestVerifyDate {
    @isTest static void testCheckDatesWithin30Days() {
        Date date1 = Date.newInstance(2018,1,1);
        Date date2 = Date.newInstance(2018,1,30);
        Date dateOut = VerifyDate.CheckDates(date1,date2);
        System.assertEquals(dateOut,date2);
    }

    @isTest static void testCheckDatesNotWithin30Days() {
        Date date1 = Date.newInstance(2018,1,1);
        Date date2 = Date.newInstance(2018,2,1);
        Date dateOut = VerifyDate.CheckDates(date1,date2);
        System.assertNotEquals(dateOut,date2);
    }

/*     
    @isTest static void testDatesNotWithin30DaysTrue() {
        Date date1 = Date.newInstance(2018,1,1);
        Date date2 = Date.newInstance(2018,1,30);
        Boolean valOut = VerifyDate.DateWithin30Days(date1,date2);
        System.assertEquals(valOut,true);
    }

   
    @isTest static void testDatesNotWithin30DaysFalse() {
        Date date1 = Date.newInstance(2018,1,1);
        Date date2 = Date.newInstance(2018,1,31);
        Boolean valOut = VerifyDate.DateWithin30Days(date1,date2);
        System.assertEquals(valOut,false);
    }
    
    @isTest static void testDatesNotWithin30DaysPast() {
        Date date1 = Date.newInstance(2018,1,30);
        Date date2 = Date.newInstance(2018,1,1);
        Boolean valOut = VerifyDate.DateWithin30Days(date1,date2);
        System.assertEquals(valOut,false);
    }
    
    @isTest static void testSetEndOfMonthDate() {
        Date date1 = Date.newInstance(2018,1,1);
        Date date2 = Date.newInstance(2018,1,31);
        Boolean valOut = VerifyDate.SetEndOfMonthDate(date1);
        System.assertEquals(valOut,date2);
    }
    */
}
