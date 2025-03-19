@AbapCatalog.sqlViewName: 'ZCAKMCPTNRSUM'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner Sum'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_PTNR_SUM
  as select from ZCAKM_I_IVIT
{
  key _Invoice.PartnerNumber,
      PositionCurrency,

      @Semantics.amount.currencyCode: 'PositionCurrency'

      sum (PositionPrice) as PriceForPartnerMetarial






}

group by
  _Invoice.PartnerNumber,
  PositionCurrency
