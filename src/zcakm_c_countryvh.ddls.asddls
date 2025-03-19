@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Own Search'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #XL,
    dataClass: #MIXED
}
@Search.searchable: true
@VDM.viewType: #CONSUMPTION
define view entity ZCAKM_C_CountryVH as select from I_Country
{
   @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.8
   @Search.ranking: #HIGH
    key Country,
    @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.8
   @Search.ranking: #LOW
    _Text[1:Language = $session.system_language].CountryName as Description
}
