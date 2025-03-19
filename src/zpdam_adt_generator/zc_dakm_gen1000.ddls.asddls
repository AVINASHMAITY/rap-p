@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_DAKM_GEN1000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_DAKM_GEN1000
{
  key UuidKey,
  Description,
  Price,
  @Semantics.currencyCode: true
  Currency,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChanged,
  LastChanged
  
}
