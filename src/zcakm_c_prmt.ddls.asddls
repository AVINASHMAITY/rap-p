@AbapCatalog.sqlViewName: 'ZCAKMCPRMT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameter'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view ZCAKM_C_PRMT   with parameters
    P_Date  : abap.dats,
    P_type  : abap.char( 1 ),
    P_Field : abap.char( 10 ) as select from ZCAKM_I_INHE
{
    key DocumentNumber,
    DocumentDate,
      PartnerName,
      _Partner.Country,
      case $parameters.P_type
          when 'A' then 'New'
          when 'B' then 'old'
          else 'unknown'
          end             as Status,
      $parameters.P_Field as ImportedField

}
where
  DocumentDate = $parameters.P_Date
