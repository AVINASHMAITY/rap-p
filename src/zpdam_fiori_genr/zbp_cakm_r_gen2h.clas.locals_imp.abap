CLASS lhc_Head DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Head RESULT result.

ENDCLASS.

CLASS lhc_Head IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.
