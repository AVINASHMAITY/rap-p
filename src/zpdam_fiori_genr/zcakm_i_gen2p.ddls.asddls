@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Items'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCAKM_I_GEN2P as projection on ZCAKM_R_GEN2P
{
    key UuidPos,
    UuidKey,
    @Semantics.amount.currencyCode: 'Currency'
    Price,
    Currency,
    LocalLastChanged,
    LastChanged,
    /* Associations */
    _Head : redirected to parent ZCAKM_I_GEN2H
}
