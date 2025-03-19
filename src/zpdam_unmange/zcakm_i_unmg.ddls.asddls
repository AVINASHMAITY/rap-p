@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Unmanage'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define root view entity ZCAKM_I_UNMG as select from zdakm_unmg
{
    key gen_key as GenKey,
    text as Text,
    cdate as Cdate
}
