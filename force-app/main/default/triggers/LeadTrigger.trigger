trigger LeadTrigger on Lead (before insert, before update, after insert){
    
    switch on trigger.operationType {
    
        //Yeni Lead kaydı yapmadan önce Lead Source’u bos iken “Other” olarak güncelleyen ve “Industry” boş ise hata veren,
        when BEFORE_INSERT{
            
            LeadTriggerHandler.beforeInsertHandler(trigger.new);
    
        }
        //Lead kaydı güncellenirken Lead Source’u bos ise “Web” olarak güncelleyen ve Lead ile contacta geçilmeden
        //kapatılmaya çalışıldığında hata veren trigger’ı oluşturunuz.
        when BEFORE_UPDATE{
            
            LeadTriggerHandler.beforeUpdateHandler(trigger.new, trigger.oldMap);

        }
        //Task OLusturma Kismi
        when AFTER_INSERT{
            
            LeadTriggerHandler.afterInsertHandler(trigger.new);

        }
    }
}