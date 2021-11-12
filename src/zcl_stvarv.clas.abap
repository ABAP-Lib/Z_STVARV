class ZCL_STVARV definition
  public
  final
  create public .

public section.

    class-methods:

        get_range
            importing
                iv_name type csequence
            changing
                cr_range type table
            raising
                ZCX_STVARV_NOT_FOUND,

        get_value
            importing
                iv_name type csequence
            returning
                value(rv_result) type string
            raising
                ZCX_STVARV_NOT_FOUND.

protected section.
private section.
ENDCLASS.



CLASS ZCL_STVARV IMPLEMENTATION.

  METHOD get_value.

    select single LOW
    from TVARVC
    into rv_result
    where NAME eq iv_name.

    if sy-subrc ne 0.
        raise exception type ZCX_STVARV_NOT_FOUND.
    endif.

  ENDMETHOD.

  method get_range.

    select SIGN OPTI as OPTION LOW HIGH
    from TVARVC
    into corresponding fields of table cr_range
    where NAME eq iv_name.

    if sy-subrc ne 0.
        raise exception type ZCX_STVARV_NOT_FOUND.
    endif.

    DATA:
            LV_REF_RANGE_LINE TYPE REF TO DATA.

    LOOP AT cr_range REFERENCE INTO LV_REF_RANGE_LINE.

        FIELD-SYMBOLS:
            <LV_FIELD> TYPE ANY.

        ASSIGN LV_REF_RANGE_LINE->('SIGN') TO <LV_FIELD>.

        IF <LV_FIELD> IS INITIAL.
            <LV_FIELD> = 'I'.
        ENDIF.

        ASSIGN LV_REF_RANGE_LINE->('OPTION') TO <LV_FIELD>.

        IF <LV_FIELD> IS INITIAL.
            <LV_FIELD> = 'EQ'.
        ENDIF.

    ENDLOOP.

  endmethod.

ENDCLASS.
