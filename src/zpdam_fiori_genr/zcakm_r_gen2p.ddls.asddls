@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interafce Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCAKM_R_GEN2P as select from zcakm_gen2p
association to parent ZCAKM_R_GEN2H as _Head on $projection.UuidKey = _Head.UuidKey
{
    key uuid_pos as UuidPos,
    uuid_key as UuidKey,
    @Semantics.amount.currencyCode: 'Currency'
    price as Price,
    currency as Currency,
    @Semantics.systemDateTime.lastChangedAt: true
    local_last_changed as LocalLastChanged,
    last_changed as LastChanged,
    _Head
}
