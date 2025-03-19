@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partner Projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION

@UI.headerInfo.title: {
    type: #STANDARD,
    value: 'Country'
}

define root view entity ZCAKM_C_PTNR
  provider contract transactional_query
  as projection on ZCAKM_I_PTNR
{

  key PartnerNumber,
      PartnerName,
      Street,
      City,
      Country,
      PaymentCurrency,
      upper_text_PartnerName,
      lower_text_City,
      PartnerInfo,
      street_null,
      last_change_at,
      /* Associations */
      _Country,
      _Currency
}
