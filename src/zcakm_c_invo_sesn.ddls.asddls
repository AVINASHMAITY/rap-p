@AbapCatalog.sqlViewName: 'ZCAKMCINVOSESN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Session Information'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_INVO_SESN
  as select from ZCAKM_I_INHE
{
  key DocumentNumber,
      DocumentDate,

      $session.system_language as SystemLanguage,

      $session.system_date     as Current_Dates


}

where
  DocumentDate < $session.system_date
