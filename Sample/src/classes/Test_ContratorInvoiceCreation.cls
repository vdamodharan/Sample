/**
    @Author  : 2C9 Vignesh
    @Purpose : Test class for Contractor Invoices
    
    @Modified for : Used Pay_Rate_2__c instead of Pay_Rate__c in Transaction Object
    @Modified on  : 30/05/2014
 */
@isTest
private class Test_ContratorInvoiceCreation {

    static testmethod void testContractorInvoiceCreation(){
        
        Test.startTest(); 
            ApexPages.StandardController sc     = new ApexPages.StandardController(new Pay_Transaction__c());           
            FileringPage Ctrl_PIC = new FileringPage(sc);
            Ctrl_PIC.Save();                        
        Test.stopTest();
        
    }
}