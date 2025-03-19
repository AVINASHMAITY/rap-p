@AbapCatalog.sqlViewName: 'ZCAKMIIVIT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Items Interface'
@Metadata.ignorePropagatedAnnotations: true
define view ZCAKM_I_IVIT
  as select from zdakm_ivit
  association [0..1] to ZCAKM_I_INHE as _Invoice  on $projection.DocumentNumber = _Invoice.DocumentNumber
  association [0..1] to ZCAKM_I_MTAR as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key document   as DocumentNumber,
  key pos_number as PositionNumber,
      material   as MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'PositonStockUnit'
      quantity   as PositionQuantity,
      stock_unit as PositonStockUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      price      as PositionPrice,
      currency   as PositionCurrency,
      _Invoice,
      _Material
}
