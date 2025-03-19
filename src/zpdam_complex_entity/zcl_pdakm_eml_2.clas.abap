CLASS zcl_pdakm_eml_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  METHODS read_data
  IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

  METHODS insert_data
  IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

  METHODS delect_data
  IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.



CLASS zcl_pdakm_eml_2 IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.
  read_data( out ).
  insert_data( out ).
  ENDMETHOD.

  METHOD read_data.

  DATA:
      lt_filter TYPE STANDARD TABLE OF ZCAKM_R_INVOICE WITH EMPTY KEY.

      lt_filter = value #( ( Document = '30000001' )
                           ( Document = '30000005' ) ).

      READ ENTITIES OF ZCAKM_R_INVOICE
      ENTITY Invoice
      ALL FIELDS WITH CORRESPONDING #( lt_filter )
      RESULT DATA(lt_Inv_data)

      ENTITY Invoice BY \_Items
      FIELDS ( Document PosNumber Material ) WITH CORRESPONDING #( lt_filter )
      RESULT DATA(lt_Item_data)
      FAILED FINAL(ls_failed).

      IF ls_failed-invoice IS NOT INITIAL.
      io_out->write( `Failed:` ).
      ENDIF.

      io_out->write( `Invoice` ).
      io_out->write( lt_Inv_data ).
      io_out->write( `Items` ).
      io_out->write( lt_Item_data ).

  ENDMETHOD.

  METHOD insert_data.

  DATA:lt_Inv_create TYPE TABLE FOR CREATE ZCAKM_R_INVOICE.
  DATA:lt_Item_create TYPE TABLE FOR CREATE ZCAKM_R_INVOICE\_Items.

  lt_Inv_create = VALUE #( ( %cid = 'A'
                             Document = '400000'
                             Partner = 'Second'
   ) ).

   lt_Item_create = VALUE #( ( %cid_ref = 'A'
                                %target = VALUE #( (
                                %cid = 'B'
                                Material = 'M001'
                                Price = '300'
                                %control = VALUE #( Material = if_abap_behv=>mk-on Price = if_abap_behv=>mk-on )
                                 ) ) ) ).

    MODIFY ENTITIES OF ZCAKM_R_INVOICE
    ENTITY Invoice
    CREATE FROM lt_Inv_create
    ENTITY Invoice
    CREATE BY \_Items FROM lt_item_create
    FAILED DATA(ls_failed).

    COMMIT ENTITIES.
    IF ls_failed-invoice IS NOT INITIAL.
    io_out->write( `Failed:` ).
    ELSE.
    io_out->write( `Creation ok` ).
    ENDIF.



  ENDMETHOD.

  METHOD delect_data.

  DATA:
  lt_filter TYPE STANDARD TABLE OF ZCAKM_R_INVOICE WITH EMPTY KEY.

  lt_filter = VALUE #( ( Document = '400000' ) ).

  MODIFY ENTITIES OF ZCAKM_R_INVOICE
  ENTITY Invoice
  DELETE FROM CORRESPONDING #( lt_filter )
  FAILED DATA(ls_failed).

  COMMIT ENTITIES.
  IF ls_failed-invoice IS NOT INITIAL.
  io_out->write( `Failed:` ).
  ELSE.
  io_out->write( `Delect Complete` ).
  ENDIF.

  ENDMETHOD.

ENDCLASS.
