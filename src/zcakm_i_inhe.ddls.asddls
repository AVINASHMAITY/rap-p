@AbapCatalog.sqlViewName: 'ZCAKMIINHE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice Interface'
@Metadata.ignorePropagatedAnnotations: true
define view ZCAKM_I_INHE as select from zdakm_inhe
  association [0..1] to ZCAKM_I_PTNR as _Partner on $projection.PartnerNumber = _Partner.PartnerNumber
  association [0..*] to ZCAKM_I_IVIT    as _Item    on $projection.DocumentNumber = _Item.DocumentNumber
{
    key document                                 as DocumentNumber,
      doc_date                                 as DocumentDate,
      doc_time                                 as DocumentTime,
      partner                                  as PartnerNumber,
      _Partner.PartnerName,

      dats_add_days( doc_date, 10 , 'INITIAL') as NewDate,
      

      _Partner,
      _Item
}
