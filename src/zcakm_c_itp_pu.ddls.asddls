@AbapCatalog.sqlViewName: 'ZCAKMCIPU'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual element'
@Metadata.ignorePropagatedAnnotations: true
define view ZCAKM_C_ITP_PU as select from ZCAKM_I_IVIT
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
    
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_PDAKM_DEMO_CDS_EXIT'
    @Semantics.amount.currencyCode: 'PositionCurrency'
    
    cast( 0 as abap.curr(15,2) ) as PricePerUnit
}
