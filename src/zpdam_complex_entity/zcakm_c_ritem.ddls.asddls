@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection items'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCAKM_C_RITEM as projection on ZCAKM_I_ITEMSS
{
    key Document,
    key PosNumber,
    Material,
    @Semantics.quantity.unitOfMeasure: 'StockUnit'
    Quantity,
    StockUnit,
    @Semantics.amount.currencyCode: 'Currency'
    Price,
    Currency,
    /* Associations */
    _Invoice : redirected to parent ZCAKM_C_INVOICE,
    _Material
}
