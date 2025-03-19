@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZCAKM_C_UNON
  as select from ZCAKM_C_ITER
{
  key DocumentNumber,
  key PositionNumber,
      'Normal' as PositionType,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      PositionPrice,
      PositionCurrency

}

where
  ErrorInConversion = ' '

union select from ZCAKM_C_ITER

{
  key DocumentNumber,
  key PositionNumber,
      'Error' as PositionType,
     cast( 0.0 as abap.curr( 15, 2 ) )   as PositionPrice,
      PositionCurrency
}
where
  ErrorInConversion = 'X'
