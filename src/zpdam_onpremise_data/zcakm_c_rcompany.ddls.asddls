@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Company'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCAKM_C_RCOMPANY provider contract transactional_query as projection on ZCAKM_I_RCOMPANY
{
    key Name,
    Branch,
    Description
}
