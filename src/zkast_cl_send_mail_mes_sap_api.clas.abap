CLASS zkast_cl_send_mail_mes_sap_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zkast_cl_send_mail_mes_sap_api IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*   lo_http_client TYPE REF TO cl_http_destination_provider,
    DATA: response       TYPE string,
          lv_body1       TYPE string,
          lo_http_client TYPE REF TO if_http_destination,
          lo_value_r1    TYPE REF TO if_web_http_request.


    TRY.
        lo_http_client = cl_http_destination_provider=>create_by_url(
       i_url     = 'https://api.openconnectors.us2.ext.hana.ondemand.com/elements/api-v2/instances'
        ).
      CATCH cx_http_dest_provider_error.
        "handle exception
    ENDTRY.
"https://api.openconnectors.us2.ext.hana.ondemand.com/elements/api-v2
"-user "f3950aa65aa3a47980fd25732e76e16f:6adef5f4669e55c707a45f903c5d7ac3"
    TRY.
        DATA(lo_http_client1) = cl_web_http_client_manager=>create_by_http_destination( i_destination = lo_http_client ).
      CATCH cx_web_http_client_error.
        "handle exception
    ENDTRY.


*
*    TRY.
*        lo_http_client1->get_http_request( )->.
*      CATCH cx_web_http_client_error.
*        "handle exception
*    ENDTRY.

    DATA(lo_request2) = lo_http_client1->get_http_request( ).

    "adding headers
    lo_request2->set_header_field( i_name = 'Content-Type' i_value = 'application/json' ).
    lo_request2->set_header_field( i_name = 'Accept' i_value = 'application/json' ).
    "API Key for API Sandbox
    lo_request2->set_header_field( i_name = 'Authorization' i_value = 'f3950aa65aa3a47980fd25732e76e16f:6adef5f4669e55c707a45f903c5d7ac3' ).

    lv_body1 = '{ "Messages":[ { "From": { "Email": "yauheni.kastsiukou@leverx.com" }, "To": [ { "Email": "yauheni.kastsiukou@leverx.com"} ] } ] }'.
    "evgenykostyukov@mail.ru
    TRY.
        lo_request2->set_text(
          EXPORTING
            i_text   = lv_body1
          RECEIVING
            r_value  = lo_value_r1
        ).
      CATCH cx_web_message_error.
    ENDTRY.


    TRY.
        DATA(lo_response) = lo_http_client1->execute( i_method = if_web_http_client=>post ).
      CATCH cx_web_http_client_error.
        "handle exception
    ENDTRY.

    DATA(lv_status) = lo_response->get_status( ).

*CATCH cx_web_message_error.

  ENDMETHOD.












ENDCLASS.
