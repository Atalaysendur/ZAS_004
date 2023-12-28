class ZCL_AS_004_OOP definition
  public
  final
  create public .

public section.

  class-data MATNR type MATNR .
  constants WERKS type WERKS_D value 1720 ##NO_TEXT.

  methods CONSTRUCTOR
    importing
      value(IV_MATNR) type MATNR .
  methods DISPLAY_ALV .
protected section.
private section.

  methods FETCH_DATA
    returning
      value(RT_TABLE) type ZAS_004_TT_OOP .
ENDCLASS.



CLASS ZCL_AS_004_OOP IMPLEMENTATION.


  method CONSTRUCTOR.
    matnr = iv_matnr.
  endmethod.


  METHOD display_alv.

    DATA: lo_salv  TYPE REF TO cl_salv_table.
    DATA(lt_table) =  fetch_data( ).

    IF lt_table IS INITIAL.
      MESSAGE E000(ZAS_004).
    ENDIF.

    cl_salv_table=>factory(
      IMPORTING
        r_salv_table   =  lo_salv
      CHANGING
        t_table        = lt_table ).

    lo_salv->set_screen_popup(
     EXPORTING
       start_column = 60
       end_column   = 120
       start_line   = 6
       end_line     = 20 ).

    lo_salv->display( ).

  ENDMETHOD.


  METHOD fetch_data.

    SELECT matnr,
           werks,
           charg
      FROM mcha
      into TABLE @rt_table
      WHERE matnr EQ @zcl_as_004_oop=>matnr
              AND werks EQ @werks.


  endmethod.
ENDCLASS.
