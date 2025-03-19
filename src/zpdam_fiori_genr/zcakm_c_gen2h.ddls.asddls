@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZCAKM_C_GEN2H provider contract transactional_query as projection on ZCAKM_R_GEN2H
{
    key UuidKey,
    Description,
    IsActive,
    LocalLastChanged,
    LastChanged,
    /* Associations */
    _Items : redirected to composition child ZCAKM_C_GEN2P
}
