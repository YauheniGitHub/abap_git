CLASS zkast_cl_insert_data_to_db DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      INTERFACES if_oo_adt_classrun .

    METHODS add_user_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zkast_cl_insert_data_to_db IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    add_user_data(  ).
    out->write( 'Data inserted' ).

  ENDMETHOD.


  METHOD add_user_data.

    DATA lt_zqals TYPE STANDARD TABLE OF zqals.

    lt_zqals = VALUE #(
    (
plant     = '3332'
material  = 'D01032222'
batch     = '002'
insplot   = 'insplot_2'
     )
    ).

    INSERT zqals FROM TABLE @lt_zqals.

ENDMETHOD.


ENDCLASS.
