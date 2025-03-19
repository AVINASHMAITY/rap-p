@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCAKM_I_GEN2H provider contract transactional_interface as projection on ZCAKM_R_GEN2H
{
    key UuidKey,
    Description,
    IsActive,
    LocalLastChanged,
    LastChanged,
    /* Associations */
    _Items : redirected to composition child ZCAKM_I_GEN2P
}
