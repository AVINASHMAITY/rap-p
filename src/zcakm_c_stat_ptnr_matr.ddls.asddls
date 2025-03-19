@AbapCatalog.sqlViewName: 'ZCAKMCSTAT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Statistic for high performance'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_STAT_PTNR_MATR as select from ZCAKM_C_PTNR_MTAR_SUM as Combine
 inner join   ZCAKM_C_PTNR_MTAR_CUNT as Number on  Combine.PartnerNumber  = Number.PartnerNumber
                                                         and Combine.MaterialNumber = Number.MaterialNumber
{
    key Combine.PartnerNumber,
  key Combine.MaterialNumber,
      Combine.PositionCurrency,
      @Semantics.amount.currencyCode: 'PositionCurrency'

      Combine.PriceForPartnerMaterial,
      Number.NumberOfDocument

}

where
      Number.NumberOfDocument         >= 10
  and Combine.PriceForPartnerMaterial <= 100000
