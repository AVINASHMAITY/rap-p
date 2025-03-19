@AbapCatalog.sqlViewName: 'ZCAKMCDISCCAST'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Concat Discount'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_DISC_CAST as select from ZCAKM_I_DISC
{
    key PartnerNumber,
    key MaterialNumber,
    DiscountValue,
    concat( cast (DiscountValue as abap.char(15) ), '%' ) as DiscoutText
}
