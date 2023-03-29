public with sharing class ECU_ApexAction {
    @InvocableMethod(label = 'label'description = 'description')
    public static void updateInvoice(List<Id> ids) {

        Set<Id> conId = new Set<Id>();

        List<Contact> contacts = [SELECT Id,Email,FirstName,LastName
                                  FROM Contact
                                  WHERE Id IN:ids];

        for ( Contact con : contacts) {

            conId.add(con.Id);


        }


        List<Invoice> conInvoice = [SELECT BillToContactId,BillingAccountId,CreatedById,CreatedDate,CurrencyIsoCode,Description,DocumentNumber,DueDate,GroupingKey,Id,InvoiceDate,InvoiceNumber,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,OwnerId,ReferenceEntityId,Status,SystemModstamp,TotalAdjustmentAmount,TotalAdjustmentAmountWithTax,TotalAdjustmentTaxAmount,TotalAmount,TotalAmountWithTax,TotalChargeAmount,TotalChargeAmountWithTax,TotalChargeTaxAmount,TotalTaxAmount
                                    FROM Invoice
                                    WHERE BillToContactId IN:conId];

        Integer i = 0;

        for ( Invoice iv : conInvoice) {

            conInvoice[i].InvoiceDate = Date.today();
            i++;


        }

        try {

            update conInvoice;

        } catch ( Exception e) {
            System.debug('<<<<<<EXception' + e.getMessage());
        }
    }

}