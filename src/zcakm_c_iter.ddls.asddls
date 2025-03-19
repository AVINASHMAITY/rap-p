@AbapCatalog.sqlViewName: 'ZCAKMCITER'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversion Item Error'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_ITER
  as select from ZCAKM_I_IVIT
{
  key DocumentNumber,
  key PositionNumber,
      MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'PositonStockUnit'
      PositionQuantity,
      PositonStockUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      PositionPrice,
      PositionCurrency,
      case PositionPrice
         when 37707 then 'X'
         else ' '
         end as ErrorInConversion
}
