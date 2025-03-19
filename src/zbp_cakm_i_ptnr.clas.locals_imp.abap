CLASS lsc_zcakm_i_ptnr DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

ENDCLASS.

CLASS lsc_zcakm_i_ptnr IMPLEMENTATION.

  METHOD adjust_numbers.

  SELECT FROM ZDAKM_PTNR
  FIELDS MAX( partner )
  INTO @DATA(lt_max_partner).

  LOOP AT mapped-partner REFERENCE INTO DATA(lr_partner).
  lt_max_partner += 1.
  lr_partner->PartnerNumber = lt_max_partner.
  ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Partner DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Partner RESULT result.
    METHODS validatekeyisfilled FOR VALIDATE ON SAVE
      IMPORTING keys FOR partner~validatekeyisfilled.
    METHODS validatecoredata FOR VALIDATE ON SAVE
      IMPORTING keys FOR partner~validatecoredata.
    METHODS fillcurrency FOR DETERMINE ON MODIFY
      IMPORTING keys FOR partner~fillcurrency.
    METHODS clearallemptystreet FOR MODIFY
      IMPORTING keys FOR ACTION partner~clearallemptystreet.

    METHODS fillemptystreets FOR MODIFY
      IMPORTING keys FOR ACTION partner~fillemptystreets.
    METHODS clearsingle FOR MODIFY
      IMPORTING keys FOR ACTION partner~clearsingle.
    METHODS fillsemptystreets FOR MODIFY
      IMPORTING keys FOR ACTION partner~fillsemptystreets RESULT result.
    METHODS copyall FOR MODIFY
      IMPORTING keys FOR ACTION partner~copyall.
    METHODS withpopup FOR MODIFY
      IMPORTING keys FOR ACTION partner~withpopup.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR partner RESULT result.

    METHODS fillemptystr FOR MODIFY
      IMPORTING keys FOR ACTION partner~fillemptystr RESULT result.
    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features FOR partner RESULT result.





ENDCLASS.

CLASS lhc_Partner IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.




  METHOD validateKeyIsFilled.

*  LOOP AT Keys INTO DATA(ls_keys) WHERE PartnerNumber IS INITIAL.
*  INSERT VALUE #( PartnerNumber = ls_Keys-PartnerNumber ) INTO TABLE failed-partner.
*  INSERT VALUE #(
*  PartnerNumber = ls_keys-PartnerNumber
*   %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error text = 'PartnerNumber is mandatory' )
*  ) INTO TABLE reported-partner.
*  ENDLOOP.

  ENDMETHOD.

  METHOD validateCoreData.

  READ ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  FIELDS ( Country PaymentCurrency )
  WITH CORRESPONDING #( keys )
  RESULT DATA(lt_partner_data)
  FAILED DATA(ls_failed)
  REPORTED DATA(ls_reported).

  LOOP AT lt_partner_data INTO DATA(ls_partner).
  SELECT SINGLE FROM I_Country
  FIELDS Country
  WHERE Country = @ls_partner-Country
  INTO @DATA(lt_found_country).
  IF sy-subrc <> 0.
  INSERT VALUE #( PartnerNumber = ls_partner-PartnerNumber ) INTO TABLE failed-partner.

  INSERT VALUE #(
  PartnerNumber = ls_partner-PartnerNumber
  %msg = new_message_with_text( text = 'country not found' )
  %element-country = if_abap_behv=>mk-on
   ) INTO TABLE reported-partner.

   ENDIF.

   SELECT SINGLE FROM I_Currency
   FIELDS Currency
   WHERE Currency = @ls_partner-PaymentCurrency
   INTO @DATA(lt_found_currency).
   IF sy-subrc <> 0.
   INSERT VALUE #( PartnerNumber = ls_partner-PartnerNumber ) INTO TABLE failed-partner.

   INSERT VALUE #(
   PartnerNumber = ls_partner-PartnerNumber
   %msg  = new_message_with_text( text = 'Currency not found' )
   %element-PaymentCurrency = if_abap_behv=>mk-on
    ) INTO TABLE reported-partner.


  ENDIF.

  ENDLOOP.

  ENDMETHOD.

  METHOD fillCurrency.

  READ ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  FIELDS ( PaymentCurrency )
  WITH CORRESPONDING #( keys )
  RESULT DATA(lt_partner_data).

  LOOP AT lt_partner_data INTO DATA(ls_partner) WHERE PaymentCurrency IS INITIAL.
  MODIFY ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  UPDATE FIELDS ( PaymentCurrency )
  WITH VALUE #( ( %tky = ls_partner-%tky PaymentCurrency = 'EUR' %control-PaymentCurrency = if_abap_behv=>mk-on ) ).
  ENDLOOP.

  ENDMETHOD.

  METHOD clearAllEmptyStreet.
  SELECT FROM ZCAKM_I_PTNR
  FIELDS PartnerNumber , Street
  WHERE Street = 'Empty'
  INTO TABLE @DATA(lt_partner_data).

  LOOP AT lt_partner_data INTO DATA(ls_partner).
  MODIFY ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  UPDATE FIELDS ( Street )
  WITH VALUE #( ( PartnerNumber = ls_partner-PartnerNumber Street = '' %control-Street = if_abap_behv=>mk-on ) ).
  ENDLOOP.

  INSERT VALUE #(
  %msg = new_message_with_text( text = |{ lines( lt_partner_data ) } records changed |
  severity = if_abap_behv_message=>severity-success ) ) INTO TABLE reported-partner.

  ENDMETHOD.

  METHOD fillEmptyStreets.

  READ ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  FIELDS ( Street )
  WITH CORRESPONDING #( keys )
  RESULT DATA(lt_partner_data).

  LOOP AT lt_partner_data INTO DATA(ls_partner) WHERE Street IS INITIAL.
  MODIFY ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  UPDATE FIELDS ( Street )
  WITH VALUE #( ( %tky = ls_partner-%tky Street = 'Empty' %control-Street = if_abap_behv=>mk-on ) ).
  ENDLOOP.

  ENDMETHOD.

  METHOD ClearSingle.

  ENDMETHOD.

  METHOD fillsEmptyStreets.

  READ ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  FIELDS ( Street )
  WITH CORRESPONDING #( keys )
  RESULT DATA(lt_partner_data).

  LOOP AT lt_partner_data INTO DATA(lt_partner) WHERE Street IS INITIAL.
  MODIFY ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  UPDATE FIELDS ( Street )
  WITH VALUE #( ( %tky = lt_partner-%tky Street = 'Empty' %control-Street = if_abap_behv=>mk-on ) ).

  INSERT VALUE #( %tky = lt_partner-%tky %param = lt_partner ) INTO TABLE result.

  ENDLOOP.

  ENDMETHOD.




  METHOD copyAll.
   DATA:
      lt_create TYPE TABLE FOR CREATE ZCAKM_I_PTNR.

  READ ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  ALL FIELDS WITH CORRESPONDING #( keys )
  RESULT DATA(lt_partner_data).

  SELECT FROM ZDAKM_PTNR
  FIELDS MAX( partner )
  INTO @DATA(lt_number).

  LOOP AT lt_partner_data INTO DATA(ls_partner).
  lt_number = lt_number + 1.
  ls_partner-PartnerNumber = lt_number.
  ls_partner-PartnerName &&= | copy|.

  INSERT VALUE #( %cid = keys[ sy-tabix ]-%cid ) INTO TABLE lt_create REFERENCE INTO DATA(lr_create).
  lr_create->* = CORRESPONDING #( ls_partner ).
  lr_create->%control-PartnerNumber = if_abap_behv=>mk-on.
  lr_create->%control-PartnerName = if_abap_behv=>mk-on.
  lr_create->%control-City = if_abap_behv=>mk-on.
  lr_create->%control-Street = if_abap_behv=>mk-on.
  lr_create->%control-Country = if_abap_behv=>mk-on.
  lr_create->%control-PaymentCurrency = if_abap_behv=>mk-on.

  ENDLOOP.

  MODIFY ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
  ENTITY Partner
  CREATE FROM lt_create
  FAILED DATA(ls_failed)
  MAPPED DATA(ls_mapped)
  REPORTED DATA(ls_reported).
  mapped-partner = ls_mapped-partner.
  ENDMETHOD.

  METHOD withPopup.
  TRY.
      DATA(ls_key) = keys[ 1 ].
    CATCH cx_sy_itab_line_not_found.
      RETURN.
  ENDTRY.

  CASE ls_key-%param-MessageType.
    WHEN 1.
      INSERT VALUE #(
        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success text = 'Dummy message' )
      ) INTO TABLE reported-partner.
    WHEN 2.
      INSERT VALUE #(
        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-information text = 'Dummy message' )
      ) INTO TABLE reported-partner.
    WHEN 3.
      INSERT VALUE #(
        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-warning text = 'Dummy message' )
      ) INTO TABLE reported-partner.
    WHEN 4.
      INSERT VALUE #(
        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error text = 'Dummy message' )
      ) INTO TABLE reported-partner.
    WHEN 5.
      INSERT VALUE #(
        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-none text = 'Dummy message' )
      ) INTO TABLE reported-partner.
    WHEN 6.
      reported-partner = VALUE #(
        ( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success text = 'Dummy message' ) )
        ( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-information text = 'Dummy message' ) )
      ).
    WHEN 7.
      reported-partner = VALUE #(
        ( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-success text = 'Dummy message' ) )
        ( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error text = 'Dummy message' ) )
        ( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-warning text = 'Dummy message' ) )
        ( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-information text = 'Dummy message' ) )
      ).
  ENDCASE.
  ENDMETHOD.

  METHOD get_instance_features.
  IF requested_features-%action-fillEmptyStr = if_abap_behv=>mk-on.
  READ ENTITIES OF ZCAKM_I_PTNR IN LOCAL MODE
    ENTITY Partner FIELDS ( Street ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_partner_data).

  LOOP AT lt_partner_data INTO DATA(ls_partner) WHERE Street IS NOT INITIAL.
    INSERT VALUE #(
      partnernumber = ls_partner-PartnerNumber
      %action-fillemptyStr = if_abap_behv=>mk-on
    ) INTO TABLE result.
  ENDLOOP.
ENDIF.

  ENDMETHOD.

  METHOD fillEmptyStr.


  ENDMETHOD.

  METHOD get_global_features.
  IF requested_features-%delete = if_abap_behv=>mk-on.
  DATA(ld_deactivate) = COND #(
    WHEN cl_abap_context_info=>get_user_alias( ) = 'CB9980000734' THEN if_abap_behv=>mk-off
    ELSE if_abap_behv=>mk-on
  ).

  result-%delete = ld_deactivate.
ENDIF.
  ENDMETHOD.

ENDCLASS.
