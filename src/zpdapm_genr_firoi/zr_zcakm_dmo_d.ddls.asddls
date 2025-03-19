@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Draft query view forZCAKM_DMO'
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
define view entity ZR_ZCAKM_DMO_D
  as select from ZZCAKM_DMO00D as ZCAKM_DMO
{
  key UuidKey as UuidKey,
  Description as Description,
  IsActive as IsActive,
  LocalLastChanged as LocalLastChanged,
  LastChanged as LastChanged,
  draftentitycreationdatetime as Draftentitycreationdatetime,
  draftentitylastchangedatetime as Draftentitylastchangedatetime,
  draftadministrativedatauuid as Draftadministrativedatauuid,
  draftentityoperationcode as Draftentityoperationcode,
  hasactiveentity as Hasactiveentity,
  draftfieldchanges as Draftfieldchanges
  
}
