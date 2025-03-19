@AbapCatalog.sqlViewName: 'ZCAKMCMTARCNVR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversion of Unit'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_MTAR_CNVR
  as select from ZCAKM_I_MTAR
{
  key MaterialNumber,
      MaterialName,

      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      Stock,


      StockUnit,

      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      unit_conversion(
          quantity     => Stock,
          source_unit  => StockUnit,
          target_unit  => cast( 'ST' as abap.unit(3) ),
          error_handling => 'SET_TO_NULL'
      ) as UnitInPieces
}
