@AbapCatalog.sqlViewName: 'ZCAKMCPTNRCURR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner currency conversion'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_PTNR_CURR_CNVR
 with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_CalculationDate : abap.dats
 as select from ZCAKM_C_PTNR_SUM
{
    key PartnerNumber,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'PositionCurrency'

      PriceForPartnerMetarial,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      currency_conversion(
      amount => PriceForPartnerMetarial,
      source_currency => PositionCurrency,
      round => 'X' ,
      target_currency => cast('USD' as abap.cuky( 5 )),
      exchange_rate_date => $parameters.P_CalculationDate,
      exchange_rate_type => 'M',
      error_handling => 'SET_TO_NULL'


      ) as PriceInUSD
}
