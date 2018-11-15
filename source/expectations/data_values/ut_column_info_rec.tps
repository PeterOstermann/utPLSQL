create or replace type ut_column_info_rec under ut_column_info
(
   nested_details ut_column_info_tab,
   member function get_anytype_attributes_info(a_anytype anytype)
      return ut_column_info_tab,
   member function get_user_defined_type(a_owner varchar2, a_type_name varchar2)
      return anytype,
   overriding member procedure init(self              in out nocopy ut_column_info_rec,
                                    a_col_type        binary_integer,
                                    a_col_name        varchar2,
                                    a_col_schema_name varchar2,
                                    a_col_type_name   varchar2,
                                    a_col_prec        integer,
                                    a_col_scale       integer,
                                    a_col_len         integer,
                                    a_dbms_sql_desc   boolean := false),
   constructor function ut_column_info_rec(self            in out nocopy ut_column_info_rec,
                                          a_col_type        binary_integer,
                                          a_col_name        varchar2,
                                          a_col_schema_name varchar2,
                                          a_col_type_name   varchar2,
                                          a_col_prec        integer,
                                          a_col_scale       integer,
                                          a_col_len         integer,
                                          a_dbms_sql_desc   boolean := false)
      return self as result
)
/