*&---------------------------------------------------------------------*
*& Report ZAS_004_P_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZAS_004_P_OOP.


PARAMETERS p_matnr TYPE matnr OBLIGATORY.
DATA(lcl_main) = NEW ZCL_AS_004_OOP( iv_matnr = p_matnr ).



END-OF-SELECTION.
lcl_main->display_alv( ).
