public class FileringPage{

    // List of fieldSets to be shown on the lead tab based on the record type of the lead
    public List<SubSectionWrapper> testFieldSet{get;set;}
    
    public Pay_Transaction__c testRecord{get;set;}
    public Pay_Transaction__c testRecord1{get;set;}
public FileringPage(ApexPages.StandardController stdController){
    
    testRecord = new Pay_Transaction__c();
    
    //initialize information fieldsets
    testFieldSet= new List<SubSectionWrapper>();

    testFieldSet.add(new SubSectionWrapper('Test Information',SObjectType.Pay_Transaction__c.FieldSets.Test.getFields()));
    
    System.debug('@@@ '+testFieldSet);
}

public void Save(){
	
	/*Sample testing*/
    
    System.debug('@@@ '+testRecord );
    insert testRecord;
    
    List<Schema.FieldSetMember> list_toQuery = new List<Schema.FieldSetMember>();
    
    for(Schema.FieldSetMember f : SObjectType.Pay_Transaction__c.FieldSets.Test.getFields()){
            list_toQuery.add(f);    
    }   
    System.debug('>>>>>>>>>' + list_toQuery);
    String query = 'SELECT ';
    for(Schema.FieldSetMember f : list_toQuery) 
    {
        query += f.getFieldPath() + ', ';
    }
    String tid = testRecord.Id;
    query += 'Id FROM Pay_Transaction__c Where Id=:tid';
    
    System.debug(query);
    
    try{
        testRecord = Database.query(query);
        testRecord1 = new Pay_Transaction__c();
        for(Schema.FieldSetMember f : list_toQuery){
            testRecord1.put(f.getFieldPath(), testRecord.get(f.getFieldPath()));
        }
        
        insert testRecord1;
    }
    catch(Exception e){
        System.debug(e.getMessage());
    }
}

    class SubSectionWrapper{
            
        public String SubSectionName {get;set;}
        public List<Schema.FieldSetMember> FieldSet{get;set;}
        
        SubSectionWrapper(String SName,List<Schema.FieldSetMember> FieldSet){
           this.SubSectionName = SName;
           this.FieldSet = FieldSet;
        }
                            
    }
}