INTERFACE zif_bs_demo_rap_data_handlers
  PUBLIC .
 TYPES:
    tt_r_key  TYPE RANGE OF zdakm_unmg-gen_key,
    tt_r_text TYPE RANGE OF zdakm_unmg-text,
    tt_r_date TYPE RANGE OF zdakm_unmg-cdate,

    ts_data   TYPE zdakm_unmg,
    tt_data   TYPE STANDARD TABLE OF ts_data WITH EMPTY KEY.

  METHODS:
    query
      IMPORTING it_r_key         TYPE tt_r_key  OPTIONAL
                it_r_text        TYPE tt_r_text OPTIONAL
                it_r_date        TYPE tt_r_date OPTIONAL
      RETURNING VALUE(rt_result) TYPE tt_data,

    read
      IMPORTING id_key           TYPE zdakm_unmg-gen_key
      RETURNING VALUE(rs_result) TYPE ts_data,

    modify
      IMPORTING is_data          TYPE ts_data
      RETURNING VALUE(rd_result) TYPE abap_boolean,

    delete
      IMPORTING id_key           TYPE zdakm_unmg-gen_key
      RETURNING VALUE(rd_result) TYPE abap_boolean.
ENDINTERFACE.
