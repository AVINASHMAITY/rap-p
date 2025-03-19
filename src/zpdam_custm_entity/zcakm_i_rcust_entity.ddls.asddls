@EndUserText.label: 'Interface Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCLAKM_RCUST_ENTITY'
define custom entity ZCAKM_I_RCUST_ENTITY
{
  key CompanyName : abap.char( 60 ); 
  Branch : abap.char( 50 );
  CompanyDescription : abap.char(255);
}
