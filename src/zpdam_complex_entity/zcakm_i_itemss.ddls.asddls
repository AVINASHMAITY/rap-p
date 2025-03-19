@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Items'

define view entity ZCAKM_I_ITEMSS as select from zdakm_ivit
association to parent ZCAKM_R_INVOICE as _Invoice on $projection.Document = _Invoice.Document
association [1] to ZCAKM_I_MTAR as _Material on $projection.Material = _Material.MaterialNumber
{

    key document as Document,
    key pos_number as PosNumber,
    material as Material,
    @Semantics.quantity.unitOfMeasure: 'StockUnit'
    quantity as Quantity,
    stock_unit as StockUnit,
    @Semantics.amount.currencyCode: 'Currency'
    price as Price,
    currency as Currency,
    _Invoice,
    _Material
}
