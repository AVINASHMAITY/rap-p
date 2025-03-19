@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forZCAKM_DMO'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'ZCAKM_DMO' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
@ObjectModel.semanticKey: [ 'UuidKey' ]
@Search.searchable: true
define root view entity ZC_ZCAKM_DMOTP
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_ZCAKM_DMOTP as ZCAKM_DMO
{
  key UuidKey,
  Description,
  IsActive,
  LocalLastChanged,
  LastChanged
  
}
