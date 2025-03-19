@EndUserText.label: 'Entity for popup'
define abstract entity ZCAKM_I_POPUP
{
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZCAKM_C_CountryVH' , element: 'Country' } }]
  SearchCountry : land1;
  NewDate       : abap.dats;
  MessageType   : abap.int4;
  FlagUpdate    : abap.char(1);
  FlagMessage   : abap_boolean;
}
