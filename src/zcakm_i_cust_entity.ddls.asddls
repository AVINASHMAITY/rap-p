@EndUserText.label: 'Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_PDAKM_CUST_ENTITY'
define custom entity ZCAKM_I_CUST_ENTITY
 
{
  key CompanyName : abap.char( 60 );
  Branch : abap.char( 50 );
  CompanyDescription : abap.char(255);
  
}
