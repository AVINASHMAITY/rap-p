@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface company'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCAKM_I_RCOMPANY as select from zdakm_cname
{
    key name as Name,
    branch as Branch,
    description as Description
}
