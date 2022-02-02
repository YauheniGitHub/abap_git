CLASS zkast_cl_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zkast_cl_test IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( | Hello world! ({ cl_abap_context_info=>get_user_alias(  ) }) | ).

  ENDMETHOD.

ENDCLASS.
