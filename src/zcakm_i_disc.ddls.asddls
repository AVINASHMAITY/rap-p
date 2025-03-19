@AbapCatalog.sqlViewName: 'ZCAKMIDISC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Discount Interface'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_I_DISC
  as select from zdakm_disc
  association [0..1] to ZCAKM_I_PTNR as _Partner  on $projection.PartnerNumber = _Partner.PartnerNumber
  association [0..1] to ZCAKM_I_MTAR as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key partner  as PartnerNumber,
  key material as MaterialNumber,
      discount as DiscountValue,
      _Partner,
      _Material
}
