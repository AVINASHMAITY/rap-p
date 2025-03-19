CLASS zclakm_rap_data_handler DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES zif_bs_demo_rap_data_handlers .
    CLASS-METHODS create_instance
      RETURNING VALUE(ro_result) TYPE REF TO zif_bs_demo_rap_data_handlers.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zclakm_rap_data_handler IMPLEMENTATION.
  METHOD create_instance.
       ro_result = NEW zclakm_rap_data_handler( ).
  ENDMETHOD.

  METHOD zif_bs_demo_rap_data_handlers~delete.
      DELETE FROM ZDAKM_UNMG WHERE gen_key = @id_key.
    rd_result = xsdbool( sy-subrc = 0 ).
  ENDMETHOD.

  METHOD zif_bs_demo_rap_data_handlers~modify.
  DATA(ls_data) = is_data.
        GET TIME STAMP FIELD ls_data-last_changed.

        IF ls_data-gen_key IS INITIAL.
          TRY.
              ls_data-gen_key = cl_system_uuid=>create_uuid_x16_static( ).

              IF ls_data-cdate IS INITIAL.
                ls_data-cdate = cl_abap_context_info=>get_system_date( ).
              ENDIF.

            CATCH cx_uuid_error.
              rd_result = abap_false.
              RETURN.
          ENDTRY.

          INSERT zdjs_un_data FROM @ls_data.

        ELSE.
          UPDATE zdjs_un_data FROM @ls_data.

        ENDIF.

        rd_result = xsdbool( sy-subrc = 0 ).
  ENDMETHOD.

  METHOD zif_bs_demo_rap_data_handlers~query.
  SELECT FROM zdakm_unmg
      FIELDS *
      WHERE gen_key IN @it_r_key
        AND text IN @it_r_text
        AND cdate IN @it_r_date
      INTO TABLE @rt_result.
  ENDMETHOD.

  METHOD zif_bs_demo_rap_data_handlers~read.
   SELECT SINGLE FROM zdakm_unmg
      FIELDS *
      WHERE gen_key = @id_key
      INTO @rs_result.
  ENDMETHOD.

ENDCLASS.
