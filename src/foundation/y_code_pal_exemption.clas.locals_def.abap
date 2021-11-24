*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
CLASS lcl_exemption_base DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS constructor IMPORTING database_access TYPE REF TO y_if_code_pal_database_access
                                  object_type TYPE trobjtype
                                  object_name TYPE sobj_name
                                  include TYPE program.

    METHODS is_exempt RETURNING VALUE(result) TYPE abap_bool.

  PROTECTED SECTION.
    DATA database_access TYPE REF TO y_if_code_pal_database_access.
    DATA object_type TYPE trobjtype.
    DATA object_name TYPE sobj_name.
    DATA include TYPE program.

  PRIVATE SECTION.
    METHODS has_tadir_generated_flag RETURNING VALUE(result) TYPE abap_bool.
    METHODS has_trdir_generated_flag RETURNING VALUE(result) TYPE abap_bool.

ENDCLASS.



CLASS lcl_exemption_of_clas DEFINITION INHERITING FROM lcl_exemption_base.
  PUBLIC SECTION.
    METHODS is_exempt REDEFINITION.

  PROTECTED SECTION.
    METHODS is_srv_maint_ui_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_odata_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_ecatt_odata_test_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_fin_infotype_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_extensibility_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_shma_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_proxy_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_sadl_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_exit_class RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_exception_class RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_bsp_application IMPORTING class_name LIKE object_name
                               RETURNING VALUE(result) TYPE abap_bool.

  PRIVATE SECTION.
    DATA class_header_data TYPE seoclassdf.

ENDCLASS.



CLASS lcl_exemption_of_fugr DEFINITION INHERITING FROM lcl_exemption_base.
  PUBLIC SECTION.
    METHODS is_exempt REDEFINITION.

  PROTECTED SECTION.
    METHODS is_table_maintenance_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_configuration_tablegenerate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_rai_generate RETURNING VALUE(result) TYPE abap_bool.

ENDCLASS.



CLASS lcl_exemption_of_prog DEFINITION INHERITING FROM lcl_exemption_base.
  PUBLIC SECTION.
    METHODS is_exempt REDEFINITION.

  PROTECTED SECTION.
    METHODS is_downport_assist_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_fin_infotyp_generate RETURNING VALUE(result) TYPE abap_bool.
    METHODS is_object_sw01_generate RETURNING VALUE(result) TYPE abap_bool.

ENDCLASS.



CLASS lcl_exemption_factory DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS get IMPORTING database_access TYPE REF TO y_if_code_pal_database_access
                                object_type TYPE trobjtype
                                object_name TYPE sobj_name
                                include TYPE program
                       RETURNING VALUE(result) TYPE REF TO lcl_exemption_base.

ENDCLASS.
