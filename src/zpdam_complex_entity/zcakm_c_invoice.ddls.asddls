@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Invoice'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZCAKM_C_INVOICE provider contract transactional_query as projection on ZCAKM_R_INVOICE
{
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    @Search.ranking: #HIGH
    key Document,
    DocDate,
    DocTime,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    Partner,
    /* Associations */
    _Items: redirected to composition child ZCAKM_C_RITEM,
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCAKM_VIRTUAL_ELEMENT'
    virtual NumberOfPosition : abap.int4
    
}
