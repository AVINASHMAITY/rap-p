CLASS zcl_akm_cname_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
  TYPES:
      tt_result TYPE STANDARD TABLE OF ZCAKM_I_RCUST_ENTITY WITH EMPTY KEY.
     METHODS:
      read_data IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
      METHODS:
       read_data_by_request
        IMPORTING
          io_request TYPE REF TO if_rap_query_request
        EXPORTING
          et_result  TYPE tt_result
          ed_count   TYPE int8.

    CONSTANTS:
     c_destination TYPE string VALUE 'https://685bd85e-501d-43dd-b091-aa6811254f67.abap-web.us10.hana.ondemand.com/sap/opu/odata/sap/ZSBAKM_COMPANY/'.

ENDCLASS.



CLASS zcl_akm_cname_query IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  read_data( out ).
  ENDMETHOD.

  METHOD read_data.
  TRY.
    DATA(lo_destination) = CL_HTTP_DESTINATION_PROVIDER=>create_by_url( c_destination ).
    DATA(lo_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
    io_out->write( lo_destination ).
          io_out->write( lo_client ).


    DATA(lo_response) = lo_client->execute( i_method = if_web_http_client=>get ).
    io_out->write( lo_response ).
*      io_out->write( lo_response->get_status(  ) ).



    CATCH cx_root INTO DATA(lo_error).

   ENDTRY.
  ENDMETHOD.

  METHOD read_data_by_request.

  ENDMETHOD.

ENDCLASS.
