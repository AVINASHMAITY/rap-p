@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Extension include view forZCAKM_DMO'
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: false, 
  dataSources: [ 'ZCAKM_DMO' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define view entity ZE_ZCAKM_DMO
  as select from ZDAKM_GENH as ZCAKM_DMO
{
  key UUID_KEY as UuidKey
  
}
