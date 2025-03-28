@EndUserText.label: 'Ranges da STVARV considerados como tabela de valores'
define table function ZTF_STVARV_RANGE_AS_TABLE
returns {
  mandt : abap.clnt;
  parametro: rvari_vnam;
  valor: rvari_val_255;
}
implemented by method ZCL_STVARV=>ZTF_STVARV_RANGE_AS_TABLE;
