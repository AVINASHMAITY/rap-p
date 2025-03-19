@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection Unmange'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{
typeName: 'Unmanage',
typeNamePlural: 'genkey',
title:{
value: 'GenKey'
}
}
@VDM.viewType: #COMPOSITE
@ObjectModel.query.implementedBy: 'ABAP:ZCAKM_UNMG_QUERY'
@Search.searchable: true
define root view entity ZCAKM_C_UNMG
  provider contract transactional_query
  as projection on ZCAKM_I_UNMG
{

      @UI.facet: [{
      id : 'UnmageFacet',
      type: #FIELDGROUP_REFERENCE,
      label: 'Unmanage',
      targetQualifier: 'Info'
       }]

      @UI:{
      selectionField: [{ position: 10 }],
      lineItem: [{ position: 10 }]
      }
      @Search.defaultSearchElement: true
  key GenKey,
      @UI:{
      selectionField: [{ position: 20 }],
      lineItem: [{ position: 20 }],
      fieldGroup: [{ qualifier: 'Info', position: 10 }]
      }

      Text,
      @UI:{
      selectionField: [{ position: 30 }],
      lineItem: [{ position: 30 }],
      fieldGroup: [{ qualifier: 'Info', position: 20 }]
      }

      Cdate
}
