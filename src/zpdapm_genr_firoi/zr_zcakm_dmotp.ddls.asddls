@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forZCAKM_DMO'
@ObjectModel.sapObjectNodeType.name: 'ZZCAKM_DMO'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ '_Extension' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity ZR_ZCAKM_DMOTP
  as select from ZDAKM_GENH as ZCAKM_DMO
  association [1] to ZE_ZCAKM_DMO as _Extension on $projection.UuidKey = _Extension.UuidKey
{
  key UUID_KEY as UuidKey,
  DESCRIPTION as Description,
  IS_ACTIVE as IsActive,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED as LocalLastChanged,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED as LastChanged,
  _Extension
  
}
