@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCAKM_R_GEN2H as select from zcakm_gen2h
composition [0..*] of ZCAKM_R_GEN2P as _Items
{
    key uuid_key as UuidKey,
    description as Description,
    is_active as IsActive,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed as LocalLastChanged,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed as LastChanged,
    _Items
}
