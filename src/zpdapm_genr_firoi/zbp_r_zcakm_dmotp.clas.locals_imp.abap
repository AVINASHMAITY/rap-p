CLASS LHC_ZCAKM_DMO DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZCAKM_DMO
        RESULT result,
      CALCULATEUUIDKEY FOR DETERMINE ON SAVE
        IMPORTING
          KEYS FOR  ZCAKM_DMO~CalculateUuidKey .
ENDCLASS.

CLASS LHC_ZCAKM_DMO IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD CALCULATEUUIDKEY.
  READ ENTITIES OF ZR_ZCAKM_DMOTP IN LOCAL MODE
    ENTITY ZCAKM_DMO
      ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(entities).
  DELETE entities WHERE UuidKey IS NOT INITIAL.
  Check entities is not initial.
  "Dummy logic to determine object_id
  SELECT MAX( UUID_KEY ) FROM ZDAKM_GENH INTO @DATA(max_object_id).
  "Add support for draft if used in modify
  "SELECT SINGLE FROM FROM ZZCAKM_DMO00D FIELDS MAX( UuidKey ) INTO @DATA(max_orderid_draft). "draft table
  "if max_orderid_draft > max_object_id
  " max_object_id = max_orderid_draft.
  "ENDIF.
  MODIFY ENTITIES OF ZR_ZCAKM_DMOTP IN LOCAL MODE
    ENTITY ZCAKM_DMO
      UPDATE FIELDS ( UuidKey )
        WITH VALUE #( FOR entity IN entities INDEX INTO i (
        %tky          = entity-%tky
        UuidKey     = max_object_id + i
  ) ).
  ENDMETHOD.
ENDCLASS.
