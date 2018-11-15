create or replace type body ut_column_info as
   member function get_data_type(a_type_code in integer,a_user_defined in boolean) return varchar2 is
   begin
    return ut_curr_usr_compound_helper.get_column_type(a_type_code,a_user_defined); 
   end;
   
   member procedure init(self            in out nocopy ut_column_info,
                         a_col_type        binary_integer,
                         a_col_name        varchar2,
                         a_col_schema_name varchar2,
                         a_col_type_name   varchar2,
                         a_col_prec        integer,
                         a_col_scale       integer,
                         a_col_len         integer,
                         a_dbms_sql_desc   boolean := false) is
   begin
      self.is_user_defined := 0;
      self.column_prec     := a_col_prec;
      self.column_len      := a_col_len;
      self.column_scale    := a_col_scale;
      self.xml_valid_name  := '"'||a_col_name||'"';   
      self.column_name     := a_col_name;
      self.column_type     := get_data_type(a_col_type,a_dbms_sql_desc);
      self.column_schema   := a_col_schema_name;
      self.is_sql_diffable := ut_utils.boolean_to_int(ut_curr_usr_compound_helper.is_sql_compare_allowed(self.column_type));
      self.is_collection   := 0;
   end;
end;
/