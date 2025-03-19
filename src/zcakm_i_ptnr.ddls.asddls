@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner Interface'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
@Metadata.allowExtensions: true
define root view entity ZCAKM_I_PTNR
  as select from zdakm_ptnr
  association [0..1] to I_Country  as _Country  on $projection.Country = _Country.Country
  association [0..1] to I_Currency as _Currency on $projection.PaymentCurrency = _Currency.Currency
{
   
  key partner                               as PartnerNumber,
     
      name                                  as PartnerName,
 
      street                                as Street,
     
      city                                  as City,
     
      country                               as Country,
      payment_currency                      as PaymentCurrency,
      upper(name)                           as upper_text_PartnerName,
      lower(city)                           as lower_text_City,

      concat_with_space(city , country , 2) as PartnerInfo,

      coalesce(street,city)                 as street_null,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat                         as last_change_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by                       as lastChangedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                            as createdAt,
      @Semantics.user.createdBy: true
      created_by                            as createdBy,
      _Country,
      _Currency
}
