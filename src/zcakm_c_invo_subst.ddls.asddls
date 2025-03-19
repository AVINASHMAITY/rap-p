@AbapCatalog.sqlViewName: 'ZCAKMCINVOSUBST'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Substring For Month'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_INVO_SUBST
  as select from ZCAKM_I_INHE
{
  key DocumentNumber,
      DocumentDate,
      substring(DocumentDate , 5 ,2 ) as MonthInDocumentdate,
      PartnerNumber
}
