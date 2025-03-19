@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AbapCatalog.extensibility.extensible: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds extension'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION

define view entity ZCAKM_C_DISC_EXTD
  as select from ZCAKM_I_DISC
{
  key PartnerNumber,
  key MaterialNumber,
      DiscountValue,

      concat_with_space(cast(DiscountValue as abap.char( 12 ) ),'%',2) as dicountInPer,
      /* Associations */
      _Material.MaterialName,
      _Material.MaterialDescription
}
