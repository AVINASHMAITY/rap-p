CLASS zcakm_unmg_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
   METHODS get_data_from_request
      IMPORTING io_request       TYPE REF TO if_rap_query_request
                ""RETURNING VALUE(rt_result) TYPE zif_bs_demo_rap_data_handler=>tt_data
      RETURNING VALUE(rt_result) TYPE zif_bs_demo_rap_data_handlers=>tt_data
      RAISING   cx_rap_query_filter_no_range.
ENDCLASS.



CLASS zcakm_unmg_query IMPLEMENTATION.
  METHOD get_data_from_request.
  DATA lt_r_key  TYPE zif_bs_demo_rap_data_handlers=>tt_r_key.
    DATA lt_r_text TYPE zif_bs_demo_rap_data_handlers=>tt_r_text.
    DATA lt_r_date TYPE zif_bs_demo_rap_data_handlers=>tt_r_date.

    DATA(lt_filter) = io_request->get_filter( )->get_as_ranges( ).
    DATA(ld_offset) = io_request->get_paging( )->get_offset( ).
    DATA(ld_pagesize) = io_request->get_paging( )->get_page_size( ).

    LOOP AT lt_filter INTO DATA(ls_filter).
      CASE ls_filter-name.
        WHEN 'GenKey'.
          lt_r_key = CORRESPONDING #( ls_filter-range ).
        WHEN 'Text'.
          lt_r_text = CORRESPONDING #( ls_filter-range ).
        WHEN 'Cdate'.
          lt_r_date = CORRESPONDING #( ls_filter-range ).
      ENDCASE.
    ENDLOOP.

    rt_result = zclakm_rap_data_handler=>create_instance( )->query( it_r_key  = lt_r_key
                                                                   it_r_text = lt_r_text
                                                                   it_r_date = lt_r_date ).
  ENDMETHOD.

  METHOD if_rap_query_provider~select.
   DATA lt_output TYPE STANDARD TABLE OF ZCAKM_C_UNMG.

    TRY.
        DATA(lt_database) = get_data_from_request( io_request ).
      CATCH cx_rap_query_filter_no_range.
    ENDTRY.
    lt_output = CORRESPONDING #( lt_database MAPPING GenKey = gen_key Text = text Cdate = cdate ).

    IF io_request->is_data_requested( ).
      io_response->set_data( lt_output ).
    ENDIF.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_output ) ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
