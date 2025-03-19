@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection items'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCAKM_C_GEN2P as projection on ZCAKM_R_GEN2P
{
    key UuidPos,
    UuidKey,
    @Semantics.amount.currencyCode: 'Currency'
    Price,
    Currency,
    LocalLastChanged,
    LastChanged,
    /* Associations */
    _Head : redirected to parent ZCAKM_C_GEN2H
}
