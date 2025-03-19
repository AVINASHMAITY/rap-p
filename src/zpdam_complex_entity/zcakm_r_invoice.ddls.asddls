@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Interface Invoice'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define root view entity ZCAKM_R_INVOICE as select from zdakm_inhe
composition [0..*] of ZCAKM_I_ITEMSS as _Items
{
@Search.defaultSearchElement: true
    key document as Document,
    doc_date as DocDate,
    doc_time as DocTime,
    @Search.defaultSearchElement: true
    partner as Partner,
    _Items
}
