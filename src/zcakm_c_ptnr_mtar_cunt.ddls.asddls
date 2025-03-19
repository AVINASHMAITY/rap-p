@AbapCatalog.sqlViewName: 'ZCAKMCPTMT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner Material Count'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_PTNR_MTAR_CUNT
  as select from ZCAKM_I_IVIT
{
  key  _Invoice.PartnerNumber,
  key  MaterialNumber,
       count( * ) as NumberOfDocument

}

group by
  _Invoice.PartnerNumber,
  MaterialNumber
