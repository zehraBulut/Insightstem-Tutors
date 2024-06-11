public class APILogScheduleable implements  Schedulable {  //schedule olusturarark method calıstr|| cshedule job : batch apexı calstrr
    
    public void execute(SchedulableContext SC){
        
    //Write here Code|| ister codunu yaz ıster cagır methodları
      Database.executeBatch(new APILogDeleteBatchable(),3); //bu method recordları sıler(yanı schedule apex : batch apexı calstrr)
       
    }
}

/*Herr gece 00:00 da calısıcak code (WINDOWS ANYMOUSTAN CALSTR):
APILogScheduleable reminder = new APILogScheduleable();
String sch = '0 0 0 * * ?';
String jobID = System.schedule('schedule job 1', sch, reminder);


//her Friday calsııcak
APILogScheduleable reminder = new APILogScheduleable();
String sch = '0 09 02 ? * SATUR';
String jobID = System.schedule('schedule job 2', sch, reminder);   */