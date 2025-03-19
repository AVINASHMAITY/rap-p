@AbapCatalog.sqlViewName: 'ZCAKMCCMPL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Joins'
@Metadata.ignorePropagatedAnnotations: true
define view ZCAKM_C_CMPL_DOCM as select from ZCAKM_I_IVIT as Position
inner join   ZCAKM_I_INHE as Head    on Head.DocumentNumber = Position.DocumentNumber
inner join   ZCAKM_I_PTNR as Partner on Partner.PartnerNumber = Head.PartnerNumber
{
    key Position.DocumentNumber,
  key Position.PositionNumber,
      Head.PartnerNumber,
      Partner.PartnerName,
      Partner.City,
      Partner.Country,
      Position.MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'PositonStockUnit'
      Position.PositionQuantity,
      Position.PositonStockUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      Position.PositionPrice,
      Position.PositionCurrency,
      Head.DocumentDate
}
