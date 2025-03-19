@AbapCatalog.sqlViewName: 'ZCAKMCPMSUM'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner Material sum'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_PTNR_MTAR_SUM
  as select from ZCAKM_I_IVIT
{
  key  _Invoice.PartnerNumber,
  key  MaterialNumber,



       PositionCurrency,

       @Semantics.amount.currencyCode: 'PositionCurrency'

       sum ( PositionPrice ) as PriceForPartnerMaterial




}
group by
  _Invoice.PartnerNumber,
  MaterialNumber,
  PositionCurrency
