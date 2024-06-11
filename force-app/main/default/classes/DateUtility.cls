/*ServiceTriggerHandler  clasında kulandım|| parametera tarıh verdıgımde gun ay yıl olrk donucek

******************************************************************************************************************/
public class DateUtility {
    
    public static string DatetoString(Date dt){ 
    //lesson 52 task| k kartının sonkulanma tarıhlerın ay ve yılın son basamaklarını almak ıstedm bu methoddta        
        string dtMonth = string.valueOf(dt.month());
        string dtYear = string.valueOf(dt.year()).substring(2,4);
        return  dtMonth + '/' + dtYear ;
              
    }

    
    public static Integer GetMonthinNumber(string MonthinWord){
        
        switch on MonthinWord {
            
            when 'January'{
                return 1;
            }
              when 'February'{
                return 2;
            }
             when 'March'{
                return 3;
            }
            when 'April'{
                return 4;
            }
            when 'May'{
                return 5;
            }
            when 'June'{
                return 6;
            }
            when 'July'{
                return 7;
            }
            when 'August'{
                return 8;
            }
            when 'September'{
                return 9;
            }
            when 'October'{
                return 10;
            }
            when 'November'{
                return 11;
            }
            when 'December'{
                return 12;
            }
            When else{
                return null;
            }
        }
    }
}