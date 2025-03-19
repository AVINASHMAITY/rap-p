@EndUserText.label: 'Custom Entity Value Help'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_PDAKM_CITY_QUERY'
define custom entity ZCAKM_I_RAPCITY_VH

{

@EndUserText.label: 'City'
@EndUserText.quickInfo: 'Name of the city'
  key City : abap.char( 60 );
  @EndUserText.label: 'CityShort'
  @EndUserText.quickInfo: 'Short Name of the city'
  CityShort : abap.char( 10 );
  
}
