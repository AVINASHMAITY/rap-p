CLASS zcl_pdakm_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pdakm_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  DATA:
  lt_selection TYPE TABLE FOR READ IMPORT ZCAKM_I_PTNR,
  lt_create TYPE TABLE FOR CREATE ZCAKM_I_PTNR,
  lt_update TYPE TABLE FOR UPDATE ZCAKM_I_PTNR.

  lt_selection = VALUE #(
  ( PartnerNumber = '1000000001' )
  ( PartnerNumber = '1000000002' )
   ).
*
*   READ ENTITIES OF ZCAKM_I_PTNR
*   ENTITY Partner
*   ALL FIELDS WITH lt_selection
*   RESULT DATA(lt_partner)
*   FAILED DATA(ls_failed)
*   REPORTED DATA(ls_reported).
*
*   out->write( lt_partner ).

    lt_create = VALUE #(
    ( %cid = 'Dummy'
    PartnerNumber = '1000000007'
    PartnerName = 'Hello'
    Street = 'Local'
    %control-PartnerNumber = if_abap_behv=>mk-on
    %control-PartnerName = if_abap_behv=>mk-on
    %control-Street = if_abap_behv=>mk-on
    )
     ).

*     MODIFY ENTITIES OF ZCAKM_I_PTNR
*     ENTITY Partner
*     CREATE FROM lt_create
*     FAILED DATA(ls_failed)
*     MAPPED DATA(ls_mapped)
*     REPORTED DATA(ls_reported).
*
*    TRY.
*    out->write( ls_mapped-partner[ 1 ]-PartnerNumber  ).
*    COMMIT ENTITIES.
*
*    CATCH cx_sy_itab_line_not_found.
*    out->write( ls_failed-partner[ 1 ]-%cid ).
*
*    ENDTRY.

    lt_update = VALUE #(
    ( PartnerNumber = '1000000007'
      PartnerName = 'world'
      Street = 'gvt'

      %control-PartnerName = if_abap_behv=>mk-on
      %control-Street = if_abap_behv=>mk-on )
     ).

     MODIFY ENTITIES OF ZCAKM_I_PTNR
     ENTITY Partner
     UPDATE FROM lt_update
     FAILED DATA(ls_failed)
     MAPPED DATA(ls_mapped)
     REPORTED DATA(ls_reported).

     IF ls_failed-partner IS INITIAL.
     out->write( 'update' ).
     COMMIT ENTITIES.
     ENDIF.


  ENDMETHOD.

ENDCLASS.
