@Metadata.allowExtensions: true
@EndUserText.label: 'GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
define root view entity ZC_DAKM_LANG
  provider contract transactional_query
  as projection on ZR_DAKM_LANG
{
  key Identification,
  SourceLanguage,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8
  SourceText,
  TargetLanguage,
  TargetText,
  LocalCreatedBy,
  LocalLastChangedBy,
  LocalLastChanged,
  LastChanged
  
}
