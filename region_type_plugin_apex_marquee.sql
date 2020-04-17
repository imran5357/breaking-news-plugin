prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.11'
,p_default_workspace_id=>24544969849595377391
,p_default_application_id=>132278
,p_default_id_offset=>0
,p_default_owner=>'PROJECTKH1'
);
end;
/
 
prompt APPLICATION 132278 - Create Profile Menu Plugin
--
-- Application Export:
--   Application:     132278
--   Name:            Create Profile Menu Plugin
--   Date and Time:   14:31 Friday April 17, 2020
--   Exported By:     IMRAN15-5357@DIU.EDU.BD
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 7665327401136514393
--   Manifest End
--   Version:         20.1.0.00.11
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/apex_marquee
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(7665327401136514393)
,p_plugin_type=>'REGION TYPE'
,p_name=>'APEX.MARQUEE'
,p_display_name=>'MarqueeText'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>'#PLUGIN_FILES#marquee.js'
,p_css_file_urls=>'#PLUGIN_FILES#marquee.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION  render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'RETURN apex_plugin.t_region_render_result',
'',
'IS',
'    VR_RESULT         APEX_PLUGIN.T_REGION_RENDER_RESULT;',
'    --l_data_type_list    apex_application_global.vc_arr2;',
'    l_column_value_list apex_plugin_util.t_column_value_list2; ',
'    ',
'    l_derection        p_region.attribute_01%TYPE := p_region.attribute_01;',
'    l_scrollamount     p_region.attribute_02%TYPE := p_region.attribute_02;',
'    l_width            p_region.attribute_03%TYPE := p_region.attribute_03;',
'    l_height           p_region.attribute_04%TYPE := p_region.attribute_04;',
'    l_bgcolor          p_region.attribute_05%TYPE := p_region.attribute_05;',
'    l_behavior         p_region.attribute_06%TYPE := p_region.attribute_06;',
'    l_color            p_region.attribute_07%TYPE := p_region.attribute_07;',
'    l_text_align       p_region.attribute_08%TYPE := p_region.attribute_08;',
'    ',
'    ',
'   ',
'BEGIN',
'',
'   APEX_JAVASCRIPT.ADD_LIBRARY(',
'        P_NAME        => ''marquee'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL,',
'        P_KEY         => ''''',
'    );',
'    ',
'    APEX_CSS.ADD_FILE(',
'        P_NAME        => ''marquee'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL,',
'        P_KEY         => ''''',
'    );',
'',
'    ----### get the data to be displayed ###----',
'    --------------------------------------------',
'    -- The first LOV column has to be a string and the second a number',
'    -- l_data_type_list(1) := apex_plugin_util.c_data_type_varchar2;',
'    -- l_data_type_list(2) := apex_plugin_util.c_data_type_number;',
'    --',
'',
'    l_column_value_list := apex_plugin_util.get_data2 (',
'                               p_sql_statement  => p_region.source,',
'                               p_min_columns    => 2,',
'                               p_max_columns    => 2,',
'                               --p_data_type_list => l_data_type_list,',
'                               --p_component_name => p_region.name, ',
'                               p_component_name => p_region.name,',
'                               --p_search_type      => apex_plugin_util.c_search_contains_case,',
'                                p_search_column_name  => 1);',
'    ',
'',
'',
'   sys.htp.p(''<marquee id="marqueeID" ',
'                       behavior="''||l_behavior||''" ',
'                       direction="''||l_derection||''" ',
'                       scrollamount="''||l_scrollamount||''"',
'                       height="''||l_height||''"',
'                       width="''||l_width||''"',
'                       bgcolor="''||l_bgcolor||''"',
'                       onmouseover="this.stop();" ',
'                       onmouseout="this.start();">',
'             <ul style="list-style-type:none;">'');',
'',
'   for i in 1.. l_column_value_list(1).value_list.count loop',
'   ',
'       sys.htp.p (''<li style="text-align:''||l_text_align||'';">',
'                      <a href="'' || sys.htf.escape_sc(l_column_value_list(2).value_list(i).varchar2_value) || ''" style="color:''||l_color||'';" target="_blank">'' -- display column -- return column',
'                                 || sys.htf.escape_sc(l_column_value_list(1).value_list(i).varchar2_value) ||''</a> ',
'                  </li>'');',
'   end loop;',
'   ',
'   sys.htp.p(''</ul>',
'             </marquee>'');',
'return VR_RESULT;',
'END render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_LOCATION:NO_DATA_FOUND_MESSAGE:VALUE_ATTRIBUTE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://www.youtube.com/channel/UCTcpHj6wPUZxcBGp-3A0x8A?sub_confirmation=1'
,p_plugin_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Any help:',
'Facebook: https://www.facebook.com/imran5357/',
'Twitter: https://twitter.com/imran5357',
'LinkedIn: https://www.linkedin.com/in/imran5357',
'Youtube:  https://www.youtube.com/channel/UCTcpHj6wPUZxcBGp-3A0x8A?sub_confirmation=1'))
,p_files_version=>4
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7665489460707524418)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Direction'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'left'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7665618866923526895)
,p_plugin_attribute_id=>wwv_flow_api.id(7665489460707524418)
,p_display_sequence=>10
,p_display_value=>'Up'
,p_return_value=>'up'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7665638984648528640)
,p_plugin_attribute_id=>wwv_flow_api.id(7665489460707524418)
,p_display_sequence=>20
,p_display_value=>'Down'
,p_return_value=>'down'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7665560739126050578)
,p_plugin_attribute_id=>wwv_flow_api.id(7665489460707524418)
,p_display_sequence=>30
,p_display_value=>'Left'
,p_return_value=>'left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7665666414304530771)
,p_plugin_attribute_id=>wwv_flow_api.id(7665489460707524418)
,p_display_sequence=>40
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7665767254501537056)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Scrolling Speed'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_default_value=>'5'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7666143632755539484)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Width'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'100%'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7666325659744543728)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Height'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'100%'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7666371208281546332)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Background'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7666227709192074983)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Behavior'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'scroll'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7666425757839107154)
,p_plugin_attribute_id=>wwv_flow_api.id(7666227709192074983)
,p_display_sequence=>10
,p_display_value=>'Scroll'
,p_return_value=>'scroll'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7666652780778556700)
,p_plugin_attribute_id=>wwv_flow_api.id(7666227709192074983)
,p_display_sequence=>20
,p_display_value=>'Slide'
,p_return_value=>'slide'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7666437609223110357)
,p_plugin_attribute_id=>wwv_flow_api.id(7666227709192074983)
,p_display_sequence=>30
,p_display_value=>'Alternate'
,p_return_value=>'alternate'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7666888499387562891)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Text Color'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(7667285615825566366)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Text align'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'left'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7667296985318567302)
,p_plugin_attribute_id=>wwv_flow_api.id(7667285615825566366)
,p_display_sequence=>10
,p_display_value=>'Left'
,p_return_value=>'left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7667305402255568210)
,p_plugin_attribute_id=>wwv_flow_api.id(7667285615825566366)
,p_display_sequence=>20
,p_display_value=>'Center'
,p_return_value=>'center'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(7667066105868120900)
,p_plugin_attribute_id=>wwv_flow_api.id(7667285615825566366)
,p_display_sequence=>30
,p_display_value=>'Right'
,p_return_value=>'right'
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(7665327669234514395)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_name=>'SOURCE_LOCATION'
,p_depending_on_has_to_exist=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select ',
'''My Youtube channel'' display, ''https://www.youtube.com/channel/UCTcpHj6wPUZxcBGp-3A0x8A?sub_confirmation=1'' url',
'from dual',
'',
'Union all',
'',
'select ',
'''My LinkedIn Account'' display, ''https://www.linkedin.com/in/imran5357'' url',
'from dual',
'',
'Union all',
'',
'select ',
'''My Twitter Account'' display, ''https://twitter.com/imran5357'' url',
'from dual',
'',
'Union all',
'',
'select ',
'''My Facebook Account'' display, ''https://www.facebook.com/imran5357/'' url',
'from dual',
'',
'Union all',
'',
'select ',
'''My Github Account'' display, ''https://github.com/imran5357'' url',
'from dual',
'</pre>'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '696628242827236D61727175656549445B646972656374696F6E3D227269676874225D27292E6C656E677468203E2030207C7C20242827236D61727175656549445B646972656374696F6E3D226C656674225D27292E6C656E677468203E2030290D0A7B';
wwv_flow_api.g_varchar2_table(2) := '0D0A202020200D0A20202020242822236D617271756565494420756C22292E637373287B2277686974652D7370616365223A20226E6F77726170222C20227769647468223A202231303025227D293B0D0A20202020242822236D61727175656549442075';
wwv_flow_api.g_varchar2_table(3) := '6C206C6922292E637373287B22646973706C6179223A2022696E6C696E65222C202270616464696E67223A202235707820323070782035707820357078227D293B0D0A7D0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(7667589689714579401)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_file_name=>'marquee.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '236D6172717565654944207B0D0A20202020626F782D736861646F773A20696E7365742030202D313570782033307078207267626128302C302C302C302E34292C2030203570782031307078207267626128302C302C302C302E35293B0D0A202020206D';
wwv_flow_api.g_varchar2_table(2) := '617267696E3A2032307078206175746F3B0D0A202020206F766572666C6F773A2068696464656E3B0D0A20202020626F726465722D7261646975733A203470783B0D0A2020202070616464696E673A203170783B0D0A202020202D7765626B69742D7573';
wwv_flow_api.g_varchar2_table(3) := '65722D73656C6563743A206E6F6E653B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(7667589956900579403)
,p_plugin_id=>wwv_flow_api.id(7665327401136514393)
,p_file_name=>'marquee.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
