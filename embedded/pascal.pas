{
	Created with Inno Setup Decompiler 1.5.0.0

	http://vdisasm.com/isd/
}

type
	Record30 = record
		field_0: Integer;
		field_1: UnicodeString;
		field_2: UnicodeString;
		field_3: UnicodeString;
		field_4: Integer;
		field_5: BOOLEAN;
	end;

var
	gvar_0, gvar_1: TNEWRADIOBUTTON;
	gvar_2, gvar_3, gvar_4, gvar_5, gvar_6: TNEWCHECKBOX;
	gvar_7, gvar_8, gvar_9: TLABEL;
	gvar_10: TBEVEL;
	gvar_11, gvar_12, gvar_13, gvar_14, gvar_15: TBITMAPIMAGE;


procedure !MAIN();
begin
	label_5049:
	exit;
end;

function STRINGSPLIT(Arg0: UnicodeString; Arg1: UnicodeString): array of UnicodeString;
var
	v_1, v_20, v_25: array of UnicodeString;
	v_2, v_5, v_10, v_11, v_13, v_14, v_17, v_19, v_24, v_26, v_28: Integer;
	v_3, v_6, v_7, v_8, v_12, v_18, v_27, v_29: UnicodeString;
	v_4, v_9, v_16: BOOLEAN;
	v_15, v_21, v_22: Pointer;
	v_23: Cardinal;
begin
	label_5050:
	label_5070:
	v_6 := Arg0;
	v_5 := LENGTH(v_6);
	v_4 := v_5 > 0;
	if not v_4 then goto label_5738;
	label_5136:
	v_7 := Arg0;
	v_8 := Arg1;
	v_2 := POS(v_8, v_7);
	v_9 := v_2 = 0;
	v_9 := not v_9;
	flag := not v_9;
	if flag then goto label_5375;
	label_5227:
	v_10 := v_2;
	v_10 := v_10 - 1;
	v_11 := 1;
	v_12 := Arg0;
	v_3 := COPY(v_12, v_11, v_10);
	v_13 := v_2;
	v_14 := 1;
	v_15 := &Arg0;
	DELETE({var}v_15, v_14, v_13);
	goto label_5475;
	label_5375:
	v_27 := Arg0;
	v_26 := LENGTH(v_27);
	v_28 := 1;
	v_29 := Arg0;
	v_3 := COPY(v_29, v_28, v_26);
	Arg0 := '';
	label_5475:
	v_18 := v_3;
	v_17 := LENGTH(v_18);
	v_16 := v_17 > 0;
	flag := not v_16;
	if flag then goto label_5733;
	label_5549:
	v_20 := v_1;
	v_19 := GETARRAYLENGTH(v_20);
	v_19 := v_19 + 1;
	v_21 := &v_1;
	SETARRAYLENGTH({var}v_21, v_19);
	v_22 := &v_1;
	v_25 := v_1;
	v_24 := GETARRAYLENGTH(v_25);
	v_24 := v_24 - 1;
	v_23 := v_24;
	v_22 := &v_22.v_23;
	v_22 := v_3;
	label_5733:
	goto label_5070;
	label_5738:
	result := v_1;
	exit;
end;

function GETBIT(Arg0: Integer; Arg1: Integer): BOOLEAN;
var
	v_1, v_2: Integer;
begin
	label_5751:
	v_1 := Arg0;
	v_2 := 1;
	v_2 := v_2 shl Arg1;
	v_1 := v_1 and v_2;
	result := v_1 <> 0;
	exit;
end;

procedure INC(var Arg0: Integer);
begin
	label_5835:
	Arg0 := Arg0 + 1;
	exit;
end;

procedure FILEDELETE_ASUSER(Arg0: UnicodeString);
var
	v_1: BOOLEAN;
	v_2, v_4, v_5, v_6, v_7, v_8, v_9, v_10: UnicodeString;
	v_3: UnicodeString;
begin
	label_5852:
	v_5 := '{localappdata}\VirtualStore\';
	v_4 := EXPANDCONSTANT(v_5);
	v_3 := v_4;
	v_8 := Arg0;
	v_7 := EXPANDCONSTANT(v_8);
	v_10 := '{sd}';
	v_9 := EXPANDCONSTANT(v_10);
	v_6 := EXTRACTRELATIVEPATH(v_9, v_7);
	v_3 := v_3 + v_6;
	v_2 := v_3;
	v_1 := DELETEFILE(v_2);
	exit;
end;

function CLASSEXIST(Arg0: UnicodeString): BOOLEAN;
var
	v_1, v_6, v_10: Integer;
	v_2, v_4, v_8: UnicodeString;
	v_3, v_7: BOOLEAN;
	v_5, v_9: UnicodeString;
begin
	label_6112:
	v_2 := Arg0;
	v_1 := LENGTH(v_2);
	result := v_1 > 0;
	if not result then goto label_6458;
	label_6178:
	v_5 := 'Software\Classes\';
	v_5 := v_5 + Arg0;
	v_4 := v_5;
	v_6 := -2147483647;
	v_3 := REGKEYEXISTS(v_6, v_4);
	if v_3 then goto label_6445;
	label_6310:
	v_9 := 'Software\Classes\';
	v_9 := v_9 + Arg0;
	v_8 := v_9;
	v_10 := -2147483646;
	v_7 := REGKEYEXISTS(v_10, v_8);
	v_3 := v_3 or v_7;
	label_6445:
	result := result and v_3;
	label_6458:
	exit;
end;

function GETCLASSKEYS(Arg0: UnicodeString): array of Record;
var
	v_1: array [0..2] of Record;
	v_2, v_3, v_5, v_6, v_7, v_8, v_9, v_10, v_12, v_13, v_14, v_15, v_16, v_17, v_19, v_20, v_21, v_22, v_25, v_27, v_28: Pointer;
	v_4, v_11, v_18, v_26: UnicodeString;
	v_23: BOOLEAN;
	v_24: Cardinal;
begin
	label_6459:
	v_2 := &v_1;
	v_2 := &v_2.0;
	v_2 := &v_2.0;
	v_2 := -2147483646;
	v_3 := &v_1;
	v_3 := &v_3.0;
	v_3 := &v_3.2;
	v_4 := 'Software\Classes\.';
	v_4 := v_4 + Arg0;
	v_3 := v_4;
	v_5 := &v_1;
	v_5 := &v_5.0;
	v_5 := &v_5.1;
	v_6 := &v_1;
	v_6 := &v_6.0;
	v_6 := &v_6.2;
	v_5 := v_6;
	v_7 := &v_1;
	v_7 := &v_7.0;
	v_7 := &v_7.3;
	v_7 := '';
	v_8 := &v_1;
	v_8 := &v_8.0;
	v_8 := &v_8.4;
	v_8 := 1;
	v_9 := &v_1;
	v_9 := &v_9.1;
	v_9 := &v_9.0;
	v_9 := -2147483647;
	v_10 := &v_1;
	v_10 := &v_10.1;
	v_10 := &v_10.2;
	v_11 := 'Software\Classes\.';
	v_11 := v_11 + Arg0;
	v_10 := v_11;
	v_12 := &v_1;
	v_12 := &v_12.1;
	v_12 := &v_12.1;
	v_13 := &v_1;
	v_13 := &v_13.1;
	v_13 := &v_13.2;
	v_12 := v_13;
	v_14 := &v_1;
	v_14 := &v_14.1;
	v_14 := &v_14.3;
	v_14 := '';
	v_15 := &v_1;
	v_15 := &v_15.1;
	v_15 := &v_15.4;
	v_15 := -1;
	v_16 := &v_1;
	v_16 := &v_16.2;
	v_16 := &v_16.0;
	v_16 := -2147483647;
	v_17 := &v_1;
	v_17 := &v_17.2;
	v_17 := &v_17.2;
	v_18 := 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.';
	v_18 := v_18 + Arg0;
	v_17 := v_18;
	v_19 := &v_1;
	v_19 := &v_19.2;
	v_19 := &v_19.1;
	v_20 := &v_1;
	v_20 := &v_20.2;
	v_20 := &v_20.2;
	v_19 := v_20;
	v_21 := &v_1;
	v_21 := &v_21.2;
	v_21 := &v_21.3;
	v_21 := 'ProgID';
	v_22 := &v_1;
	v_22 := &v_22.2;
	v_22 := &v_22.4;
	v_22 := 2;
	v_24 := GETWINDOWSVERSION();
	v_24 := v_24 shr 24;
	v_23 := v_24 >= 6;
	flag := not v_23;
	if flag then goto label_8108;
	label_7889:
	v_25 := &v_1;
	v_25 := &v_25.2;
	v_25 := &v_25.2;
	v_27 := &v_1;
	v_27 := &v_27.2;
	v_27 := &v_27.2;
	v_26 := v_27;
	v_26 := v_26 + '\UserChoice';
	v_25 := v_26;
	v_28 := &v_1;
	v_28 := &v_28.2;
	v_28 := &v_28.5;
	v_28 := 1;
	label_8108:
	result := v_1;
	exit;
end;

procedure ASSOCIATEEXT(Arg0: UnicodeString);
var
	v_1, v_10, v_16, v_26, v_36, v_46, v_54, v_59, v_73, v_78, v_88, v_96, v_107, v_116, v_120, v_129, v_134, v_145, v_147, v_159: Integer;
	v_2, v_17: array of Record;
	v_3, v_4, v_5, v_6, v_9, v_12, v_13, v_23, v_33, v_40, v_43, v_50, v_51, v_60, v_61, v_63, v_70, v_79, v_80, v_85, v_97, v_98, v_100, v_101, v_104, v_110, v_112, v_117, v_121, v_122, v_124, v_125, v_126, v_135, v_136, v_138, v_142, v_143, v_152, v_153, v_155, v_157, v_158: UnicodeString;
	v_7, v_8, v_11, v_15, v_18, v_19, v_22, v_29, v_32, v_57, v_58, v_62, v_64, v_65, v_66, v_69, v_76, v_77, v_81, v_84, v_91, v_94, v_95, v_99, v_114, v_115, v_118, v_119, v_123, v_132, v_133, v_137, v_139, v_141, v_146, v_149, v_151: BOOLEAN;
	v_14, v_20, v_24, v_27, v_30, v_34, v_37, v_39, v_41, v_44, v_47, v_49, v_52, v_55, v_67, v_71, v_74, v_82, v_86, v_89, v_92, v_102, v_105, v_108, v_127, v_130: Pointer;
	v_21, v_25, v_28, v_31, v_35, v_38, v_42, v_45, v_48, v_53, v_56, v_68, v_72, v_75, v_83, v_87, v_90, v_93, v_103, v_106, v_109, v_128, v_131, v_140, v_150: Cardinal;
	v_111, v_144, v_148, v_154, v_156: UnicodeString;
	v_113: Int64;
begin
	label_8120:
	v_9 := Arg0;
	v_2 := GETCLASSKEYS(v_9);
	v_3 := 'PotPlayerMini.%ext%';
	v_11 := 1;
	v_12 := Arg0;
	v_13 := '%ext%';
	v_14 := &v_3;
	v_10 := STRINGCHANGEEX({var}v_14, v_13, v_12, v_11);
	v_1 := 0;
	label_8363:
	v_17 := v_2;
	v_16 := GETARRAYLENGTH(v_17);
	v_16 := v_16 - 1;
	v_15 := v_1 <= v_16;
	if not v_15 then goto label_12073;
	label_8441:
	v_20 := &v_2;
	v_21 := v_1;
	v_20 := &v_20.v_21;
	v_20 := &v_20.4;
	v_19 := v_20 = 2;
	if not v_19 then goto label_8744;
	label_8546:
	v_24 := &v_2;
	v_25 := v_1;
	v_24 := &v_24.v_25;
	v_24 := &v_24.1;
	v_23 := v_24;
	v_27 := &v_2;
	v_28 := v_1;
	v_27 := &v_27.v_28;
	v_27 := &v_27.0;
	v_26 := v_27;
	v_22 := REGKEYEXISTS(v_26, v_23);
	v_22 := not v_22;
	v_19 := v_19 and v_22;
	label_8744:
	v_18 := v_19;
	flag := not v_18;
	if flag then goto label_8779;
	label_8769:
	goto label_12062;
	goto label_9067;
	label_8779:
	v_30 := &v_2;
	v_31 := v_1;
	v_30 := &v_30.v_31;
	v_30 := &v_30.4;
	v_29 := v_30 < 0;
	flag := not v_29;
	if flag then goto label_9067;
	label_8882:
	v_34 := &v_2;
	v_35 := v_1;
	v_34 := &v_34.v_35;
	v_34 := &v_34.1;
	v_33 := v_34;
	v_37 := &v_2;
	v_38 := v_1;
	v_37 := &v_37.v_38;
	v_37 := &v_37.0;
	v_36 := v_37;
	v_32 := REGDELETEKEYINCLUDINGSUBKEYS(v_36, v_33);
	goto label_12062;
	label_9067:
	v_39 := &v_5;
	v_41 := &v_2;
	v_42 := v_1;
	v_41 := &v_41.v_42;
	v_41 := &v_41.3;
	v_40 := v_41;
	v_44 := &v_2;
	v_45 := v_1;
	v_44 := &v_44.v_45;
	v_44 := &v_44.2;
	v_43 := v_44;
	v_47 := &v_2;
	v_48 := v_1;
	v_47 := &v_47.v_48;
	v_47 := &v_47.0;
	v_46 := v_47;
	v_7 := REGQUERYSTRINGVALUE(v_46, v_43, v_40, {var}v_39);
	v_49 := &v_6;
	v_50 := 'DaumLiveBackup.bak';
	v_52 := &v_2;
	v_53 := v_1;
	v_52 := &v_52.v_53;
	v_52 := &v_52.2;
	v_51 := v_52;
	v_55 := &v_2;
	v_56 := v_1;
	v_55 := &v_55.v_56;
	v_55 := &v_55.0;
	v_54 := v_55;
	v_8 := REGQUERYSTRINGVALUE(v_54, v_51, v_50, {var}v_49);
	v_57 := v_7;
	if not v_57 then goto label_9704;
	label_9613:
	v_60 := v_3;
	v_61 := v_5;
	v_59 := COMPARETEXT(v_61, v_60);
	v_58 := v_59 <> 0;
	v_57 := v_57 and v_58;
	label_9704:
	if not v_57 then goto label_9761;
	label_9714:
	v_63 := v_5;
	v_62 := CLASSEXIST(v_63);
	v_57 := v_57 and v_62;
	label_9761:
	flag := not v_57;
	if flag then goto label_9790;
	label_9774:
	v_4 := v_5;
	goto label_10008;
	label_9790:
	v_132 := v_8;
	if not v_132 then goto label_9907;
	label_9816:
	v_135 := v_3;
	v_136 := v_6;
	v_134 := COMPARETEXT(v_136, v_135);
	v_133 := v_134 <> 0;
	v_132 := v_132 and v_133;
	label_9907:
	if not v_132 then goto label_9964;
	label_9917:
	v_138 := v_6;
	v_137 := CLASSEXIST(v_138);
	v_132 := v_132 and v_137;
	label_9964:
	flag := not v_132;
	if flag then goto label_9993;
	label_9977:
	v_4 := v_6;
	goto label_10008;
	label_9993:
	v_4 := '';
	label_10008:
	v_67 := &v_2;
	v_68 := v_1;
	v_67 := &v_67.v_68;
	v_67 := &v_67.5;
	v_66 := v_67;
	if not v_66 then goto label_10300;
	label_10108:
	v_71 := &v_2;
	v_72 := v_1;
	v_71 := &v_71.v_72;
	v_71 := &v_71.2;
	v_70 := v_71;
	v_74 := &v_2;
	v_75 := v_1;
	v_74 := &v_74.v_75;
	v_74 := &v_74.0;
	v_73 := v_74;
	v_69 := REGKEYEXISTS(v_73, v_70);
	v_66 := v_66 and v_69;
	label_10300:
	v_65 := v_66;
	if not v_65 then goto label_10571;
	label_10322:
	v_76 := v_7;
	v_76 := not v_76;
	if v_76 then goto label_10445;
	label_10354:
	v_79 := v_3;
	v_80 := v_5;
	v_78 := COMPARETEXT(v_80, v_79);
	v_77 := v_78 <> 0;
	v_76 := v_76 or v_77;
	label_10445:
	if v_76 then goto label_10558;
	label_10455:
	v_82 := &v_2;
	v_83 := v_1;
	v_82 := &v_82.v_83;
	v_82 := &v_82.4;
	v_81 := v_82 = 0;
	v_76 := v_76 or v_81;
	label_10558:
	v_65 := v_65 and v_76;
	label_10571:
	v_64 := v_65;
	flag := not v_64;
	if flag then goto label_10776;
	label_10596:
	v_86 := &v_2;
	v_87 := v_1;
	v_86 := &v_86.v_87;
	v_86 := &v_86.2;
	v_85 := v_86;
	v_89 := &v_2;
	v_90 := v_1;
	v_89 := &v_89.v_90;
	v_89 := &v_89.0;
	v_88 := v_89;
	v_84 := REGDELETEKEYINCLUDINGSUBKEYS(v_88, v_85);
	label_10776:
	v_92 := &v_2;
	v_93 := v_1;
	v_92 := &v_92.v_93;
	v_92 := &v_92.4;
	v_91 := v_92 > 0;
	if not v_91 then goto label_11012;
	label_10876:
	v_94 := v_7;
	v_94 := not v_94;
	if v_94 then goto label_10999;
	label_10908:
	v_97 := v_3;
	v_98 := v_5;
	v_96 := COMPARETEXT(v_98, v_97);
	v_95 := v_96 <> 0;
	v_94 := v_94 or v_95;
	label_10999:
	v_91 := v_91 and v_94;
	label_11012:
	flag := not v_91;
	if flag then goto label_11549;
	label_11025:
	v_100 := v_3;
	v_102 := &v_2;
	v_103 := v_1;
	v_102 := &v_102.v_103;
	v_102 := &v_102.3;
	v_101 := v_102;
	v_105 := &v_2;
	v_106 := v_1;
	v_105 := &v_105.v_106;
	v_105 := &v_105.2;
	v_104 := v_105;
	v_108 := &v_2;
	v_109 := v_1;
	v_108 := &v_108.v_109;
	v_108 := &v_108.0;
	v_107 := v_108;
	v_99 := REGWRITESTRINGVALUE(v_107, v_104, v_101, v_100);
	v_99 := not v_99;
	flag := not v_99;
	if flag then goto label_11549;
	label_11321:
	v_111 := 'Associations Helper: Associating failed for: .';
	v_111 := v_111 + Arg0;
	v_111 := v_111 + ' at key #';
	v_113 := v_1;
	v_112 := INTTOSTR(v_113);
	v_111 := v_111 + v_112;
	v_110 := v_111;
	RAISEEXCEPTION(v_110);
	label_11549:
	v_114 := v_8;
	v_114 := not v_114;
	if not v_114 then goto label_11655;
	label_11581:
	v_117 := v_4;
	v_116 := LENGTH(v_117);
	v_115 := v_116 > 0;
	v_114 := v_114 and v_115;
	label_11655:
	if v_114 then goto label_11795;
	label_11665:
	v_118 := v_8;
	if not v_118 then goto label_11782;
	label_11691:
	v_121 := v_4;
	v_122 := v_6;
	v_120 := COMPARETEXT(v_122, v_121);
	v_119 := v_120 <> 0;
	v_118 := v_118 and v_119;
	label_11782:
	v_114 := v_114 or v_118;
	label_11795:
	flag := not v_114;
	if flag then goto label_12062;
	label_11808:
	v_124 := v_4;
	v_125 := 'DaumLiveBackup.bak';
	v_127 := &v_2;
	v_128 := v_1;
	v_127 := &v_127.v_128;
	v_127 := &v_127.2;
	v_126 := v_127;
	v_130 := &v_2;
	v_131 := v_1;
	v_130 := &v_130.v_131;
	v_130 := &v_130.0;
	v_129 := v_130;
	v_123 := REGWRITESTRINGVALUE(v_129, v_126, v_125, v_124);
	label_12062:
	inc(v_1);
	goto label_8363;
	label_12073:
	v_140 := GETWINDOWSVERSION();
	v_140 := v_140 shr 24;
	v_139 := v_140 >= 6;
	v_139 := not v_139;
	flag := not v_139;
	if flag then goto label_12407;
	label_12153:
	v_142 := 'Application';
	v_144 := 'Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.';
	v_144 := v_144 + Arg0;
	v_143 := v_144;
	v_145 := -2147483647;
	v_141 := REGDELETEVALUE(v_145, v_143, v_142);
	label_12407:
	v_148 := 'Software\Clients\Media\PotPlayerMini\Capabilities';
	v_147 := LENGTH(v_148);
	v_146 := v_147 > 0;
	if not v_146 then goto label_12653;
	label_12580:
	v_150 := GETWINDOWSVERSION();
	v_150 := v_150 shr 24;
	v_149 := v_150 >= 6;
	v_146 := v_146 and v_149;
	label_12653:
	flag := not v_146;
	if flag then goto label_12989;
	label_12666:
	v_152 := v_3;
	v_154 := '.';
	v_154 := v_154 + Arg0;
	v_153 := v_154;
	v_158 := 'Software\Clients\Media\PotPlayerMini\Capabilities';
	v_157 := ADDBACKSLASH(v_158);
	v_156 := v_157;
	v_156 := v_156 + 'FileAssociations';
	v_155 := v_156;
	v_159 := -2147483646;
	v_151 := REGWRITESTRINGVALUE(v_159, v_155, v_153, v_152);
	label_12989:
	exit;
end;

procedure ASSOCIATEEXTS(Arg0: UnicodeString);
var
	v_1, v_6: Integer;
	v_2, v_7: array of UnicodeString;
	v_3, v_4, v_8: UnicodeString;
	v_5: BOOLEAN;
begin
	label_12990:
	v_3 := '|';
	v_4 := Arg0;
	v_2 := STRINGSPLIT(v_4, v_3);
	v_1 := 0;
	label_13068:
	v_7 := v_2;
	v_6 := GETARRAYLENGTH(v_7);
	v_6 := v_6 - 1;
	v_5 := v_1 <= v_6;
	if not v_5 then goto label_13183;
	label_13146:
	v_8 := v_2[v_1];
	ASSOCIATEEXT(v_8);
	inc(v_1);
	goto label_13068;
	label_13183:
	exit;
end;

procedure ASSOCIATEEXTS_APPEXTS();
var
	v_1: UnicodeString;
begin
	label_13185:
	v_1 := '3G2|3GP|3GP2|3GPP|AAC|AC3|AMR|AMV|APE|ASF|ASS|ASX|AVI|CUE|DIVX|DMSKM|DPG|DPL|DTS|DVR-MS|EVO|FLAC|FLV|IDX|IFO|K3G|LMP4|M1A|M1V|M2A|M2T|M2TS|M2V|M3U|M4A|M4B|M4P|M4V|MKA|MKV|MOD|MOV|MP2|MP2V|MP3|MP4|MPA|MPC|MPE|MPEG|MPG|MPLS|MPV2|MQV|MTS|NSR|NSV|OGG|OGM|OGV|PLS|QT|RA|RAM|RM|RMVB|RPM|SKM|SMI|SRT|SSA|SUB|SWF|TAK|TP|TPR|TRP|TS|VOB|WAV|WAX|WM|WMA|WMP|WMV|WMX|WVX|BIK|WEBM|WV|MXF';
	ASSOCIATEEXTS(v_1);
	exit;
end;

procedure RESTOREEXT(Arg0: UnicodeString);
var
	v_1, v_9, v_15, v_24, v_32, v_36, v_44, v_50, v_62, v_74, v_82, v_90, v_99, v_107, v_115, v_123, v_131, v_138, v_145, v_155, v_159, v_164, v_168: Integer;
	v_2, v_16: array of Record;
	v_3, v_4, v_5, v_8, v_11, v_12, v_18, v_21, v_28, v_29, v_37, v_38, v_40, v_45, v_46, v_51, v_59, v_67, v_68, v_71, v_78, v_79, v_86, v_87, v_94, v_95, v_103, v_111, v_119, v_127, v_135, v_142, v_149, v_152, v_160, v_162, v_166: UnicodeString;
	v_6, v_7, v_10, v_14, v_35, v_39, v_41, v_42, v_43, v_47, v_48, v_49, v_52, v_55, v_58, v_65, v_66, v_77, v_85, v_93, v_102, v_110, v_118, v_126, v_134, v_141, v_148, v_158, v_161, v_165: BOOLEAN;
	v_13, v_17, v_19, v_22, v_25, v_27, v_30, v_33, v_53, v_56, v_60, v_63, v_69, v_72, v_75, v_80, v_83, v_88, v_91, v_97, v_100, v_105, v_108, v_113, v_116, v_121, v_124, v_129, v_132, v_136, v_139, v_143, v_146, v_150, v_153, v_156: Pointer;
	v_20, v_23, v_26, v_31, v_34, v_54, v_57, v_61, v_64, v_70, v_73, v_76, v_81, v_84, v_89, v_92, v_98, v_101, v_106, v_109, v_114, v_117, v_122, v_125, v_130, v_133, v_137, v_140, v_144, v_147, v_151, v_154, v_157: Cardinal;
	v_96, v_104, v_112, v_120, v_128, v_163, v_167: UnicodeString;
begin
	label_13958:
	v_8 := Arg0;
	v_2 := GETCLASSKEYS(v_8);
	v_3 := 'PotPlayerMini.%ext%';
	v_10 := 1;
	v_11 := Arg0;
	v_12 := '%ext%';
	v_13 := &v_3;
	v_9 := STRINGCHANGEEX({var}v_13, v_12, v_11, v_10);
	v_1 := 0;
	label_14196:
	v_16 := v_2;
	v_15 := GETARRAYLENGTH(v_16);
	v_15 := v_15 - 1;
	v_14 := v_1 <= v_15;
	if not v_14 then goto label_18271;
	label_14274:
	v_17 := &v_4;
	v_19 := &v_2;
	v_20 := v_1;
	v_19 := &v_19.v_20;
	v_19 := &v_19.3;
	v_18 := v_19;
	v_22 := &v_2;
	v_23 := v_1;
	v_22 := &v_22.v_23;
	v_22 := &v_22.2;
	v_21 := v_22;
	v_25 := &v_2;
	v_26 := v_1;
	v_25 := &v_25.v_26;
	v_25 := &v_25.0;
	v_24 := v_25;
	v_6 := REGQUERYSTRINGVALUE(v_24, v_21, v_18, {var}v_17);
	v_27 := &v_5;
	v_28 := 'DaumLiveBackup.bak';
	v_30 := &v_2;
	v_31 := v_1;
	v_30 := &v_30.v_31;
	v_30 := &v_30.2;
	v_29 := v_30;
	v_33 := &v_2;
	v_34 := v_1;
	v_33 := &v_33.v_34;
	v_33 := &v_33.0;
	v_32 := v_33;
	v_7 := REGQUERYSTRINGVALUE(v_32, v_29, v_28, {var}v_27);
	if not v_7 then goto label_14895;
	label_14804:
	v_37 := v_3;
	v_38 := v_5;
	v_36 := COMPARETEXT(v_38, v_37);
	v_35 := v_36 <> 0;
	v_7 := v_7 and v_35;
	label_14895:
	if not v_7 then goto label_14952;
	label_14905:
	v_40 := v_5;
	v_39 := CLASSEXIST(v_40);
	v_7 := v_7 and v_39;
	label_14952:
	v_42 := v_6;
	if not v_42 then goto label_15074;
	label_14983:
	v_45 := v_3;
	v_46 := v_4;
	v_44 := COMPARETEXT(v_46, v_45);
	v_43 := v_44 = 0;
	v_42 := v_42 and v_43;
	label_15074:
	if v_42 then goto label_15355;
	label_15084:
	v_47 := v_7;
	if not v_47 then goto label_15229;
	label_15110:
	v_48 := v_6;
	v_48 := not v_48;
	if v_48 then goto label_15216;
	label_15142:
	v_51 := v_4;
	v_50 := LENGTH(v_51);
	v_49 := v_50 = 0;
	v_48 := v_48 or v_49;
	label_15216:
	v_47 := v_47 and v_48;
	label_15229:
	if not v_47 then goto label_15342;
	label_15239:
	v_53 := &v_2;
	v_54 := v_1;
	v_53 := &v_53.v_54;
	v_53 := &v_53.4;
	v_52 := v_53 = 0;
	v_47 := v_47 and v_52;
	label_15342:
	v_42 := v_42 or v_47;
	label_15355:
	v_41 := v_42;
	flag := not v_41;
	if flag then goto label_16226;
	label_15380:
	v_56 := &v_2;
	v_57 := v_1;
	v_56 := &v_56.v_57;
	v_56 := &v_56.5;
	v_55 := v_56;
	flag := not v_55;
	if flag then goto label_15653;
	label_15473:
	v_60 := &v_2;
	v_61 := v_1;
	v_60 := &v_60.v_61;
	v_60 := &v_60.2;
	v_59 := v_60;
	v_63 := &v_2;
	v_64 := v_1;
	v_63 := &v_63.v_64;
	v_63 := &v_63.0;
	v_62 := v_63;
	v_58 := REGDELETEKEYINCLUDINGSUBKEYS(v_62, v_59);
	label_15653:
	v_65 := v_7;
	flag := not v_65;
	if flag then goto label_15965;
	label_15682:
	v_67 := v_5;
	v_69 := &v_2;
	v_70 := v_1;
	v_69 := &v_69.v_70;
	v_69 := &v_69.3;
	v_68 := v_69;
	v_72 := &v_2;
	v_73 := v_1;
	v_72 := &v_72.v_73;
	v_72 := &v_72.2;
	v_71 := v_72;
	v_75 := &v_2;
	v_76 := v_1;
	v_75 := &v_75.v_76;
	v_75 := &v_75.0;
	v_74 := v_75;
	v_66 := REGWRITESTRINGVALUE(v_74, v_71, v_68, v_67);
	goto label_16226;
	label_15965:
	v_150 := &v_2;
	v_151 := v_1;
	v_150 := &v_150.v_151;
	v_150 := &v_150.3;
	v_149 := v_150;
	v_153 := &v_2;
	v_154 := v_1;
	v_153 := &v_153.v_154;
	v_153 := &v_153.2;
	v_152 := v_153;
	v_156 := &v_2;
	v_157 := v_1;
	v_156 := &v_156.v_157;
	v_156 := &v_156.0;
	v_155 := v_156;
	v_148 := REGDELETEVALUE(v_155, v_152, v_149);
	label_16226:
	v_78 := 'DaumLiveBackup.bak';
	v_80 := &v_2;
	v_81 := v_1;
	v_80 := &v_80.v_81;
	v_80 := &v_80.2;
	v_79 := v_80;
	v_83 := &v_2;
	v_84 := v_1;
	v_83 := &v_83.v_84;
	v_83 := &v_83.0;
	v_82 := v_83;
	v_77 := REGDELETEVALUE(v_82, v_79, v_78);
	v_86 := 'DaumLiveBackup.bak';
	v_88 := &v_2;
	v_89 := v_1;
	v_88 := &v_88.v_89;
	v_88 := &v_88.1;
	v_87 := v_88;
	v_91 := &v_2;
	v_92 := v_1;
	v_91 := &v_91.v_92;
	v_91 := &v_91.0;
	v_90 := v_91;
	v_85 := REGDELETEVALUE(v_90, v_87, v_86);
	v_94 := v_3;
	v_97 := &v_2;
	v_98 := v_1;
	v_97 := &v_97.v_98;
	v_97 := &v_97.1;
	v_96 := v_97;
	v_96 := v_96 + '\OpenWithProgids';
	v_95 := v_96;
	v_100 := &v_2;
	v_101 := v_1;
	v_100 := &v_100.v_101;
	v_100 := &v_100.0;
	v_99 := v_100;
	v_93 := REGDELETEVALUE(v_99, v_95, v_94);
	v_105 := &v_2;
	v_106 := v_1;
	v_105 := &v_105.v_106;
	v_105 := &v_105.1;
	v_104 := v_105;
	v_104 := v_104 + '\OpenWithProgids';
	v_103 := v_104;
	v_108 := &v_2;
	v_109 := v_1;
	v_108 := &v_108.v_109;
	v_108 := &v_108.0;
	v_107 := v_108;
	v_102 := REGDELETEKEYIFEMPTY(v_107, v_103);
	v_113 := &v_2;
	v_114 := v_1;
	v_113 := &v_113.v_114;
	v_113 := &v_113.1;
	v_112 := v_113;
	v_112 := v_112 + '\OpenWithList';
	v_111 := v_112;
	v_116 := &v_2;
	v_117 := v_1;
	v_116 := &v_116.v_117;
	v_116 := &v_116.0;
	v_115 := v_116;
	v_110 := REGDELETEKEYIFEMPTY(v_115, v_111);
	v_121 := &v_2;
	v_122 := v_1;
	v_121 := &v_121.v_122;
	v_121 := &v_121.1;
	v_120 := v_121;
	v_120 := v_120 + '\Shell';
	v_119 := v_120;
	v_124 := &v_2;
	v_125 := v_1;
	v_124 := &v_124.v_125;
	v_124 := &v_124.0;
	v_123 := v_124;
	v_118 := REGDELETEKEYIFEMPTY(v_123, v_119);
	v_129 := &v_2;
	v_130 := v_1;
	v_129 := &v_129.v_130;
	v_129 := &v_129.1;
	v_128 := v_129;
	v_128 := v_128 + '\ShellEx';
	v_127 := v_128;
	v_132 := &v_2;
	v_133 := v_1;
	v_132 := &v_132.v_133;
	v_132 := &v_132.0;
	v_131 := v_132;
	v_126 := REGDELETEKEYIFEMPTY(v_131, v_127);
	v_136 := &v_2;
	v_137 := v_1;
	v_136 := &v_136.v_137;
	v_136 := &v_136.2;
	v_135 := v_136;
	v_139 := &v_2;
	v_140 := v_1;
	v_139 := &v_139.v_140;
	v_139 := &v_139.0;
	v_138 := v_139;
	v_134 := REGDELETEKEYIFEMPTY(v_138, v_135);
	v_143 := &v_2;
	v_144 := v_1;
	v_143 := &v_143.v_144;
	v_143 := &v_143.1;
	v_142 := v_143;
	v_146 := &v_2;
	v_147 := v_1;
	v_146 := &v_146.v_147;
	v_146 := &v_146.0;
	v_145 := v_146;
	v_141 := REGDELETEKEYIFEMPTY(v_145, v_142);
	inc(v_1);
	goto label_14196;
	label_18271:
	v_160 := v_3;
	v_159 := LENGTH(v_160);
	v_158 := v_159 > 0;
	flag := not v_158;
	if flag then goto label_18592;
	label_18346:
	v_163 := 'Software\Classes\';
	v_163 := v_163 + v_3;
	v_162 := v_163;
	v_164 := -2147483647;
	v_161 := REGDELETEKEYINCLUDINGSUBKEYS(v_164, v_162);
	v_167 := 'Software\Classes\';
	v_167 := v_167 + v_3;
	v_166 := v_167;
	v_168 := -2147483646;
	v_165 := REGDELETEKEYINCLUDINGSUBKEYS(v_168, v_166);
	label_18592:
	exit;
end;

procedure RESTOREEXTS(Arg0: UnicodeString);
var
	v_1, v_6: Integer;
	v_2, v_7: array of UnicodeString;
	v_3, v_4, v_8: UnicodeString;
	v_5: BOOLEAN;
begin
	label_18593:
	v_3 := '|';
	v_4 := Arg0;
	v_2 := STRINGSPLIT(v_4, v_3);
	v_1 := 0;
	label_18671:
	v_7 := v_2;
	v_6 := GETARRAYLENGTH(v_7);
	v_6 := v_6 - 1;
	v_5 := v_1 <= v_6;
	if not v_5 then goto label_18786;
	label_18749:
	v_8 := v_2[v_1];
	RESTOREEXT(v_8);
	inc(v_1);
	goto label_18671;
	label_18786:
	exit;
end;

procedure MANAGEOPENWITH(Arg0: UnicodeString; Arg1: Integer);
var
	v_1, v_2, v_9, v_12, v_24, v_32, v_36, v_44: Integer;
	v_3, v_10: array of UnicodeString;
	v_4, v_37: array of Record;
	v_5, v_6, v_7, v_11, v_14, v_15, v_20, v_21, v_28, v_29, v_39, v_40: UnicodeString;
	v_8, v_13, v_17, v_18, v_19, v_26, v_34, v_35, v_38: BOOLEAN;
	v_16, v_23, v_25, v_31, v_33, v_42, v_45: Pointer;
	v_22, v_30, v_41: UnicodeString;
	v_27: String;
	v_43, v_46: Cardinal;
begin
	label_18788:
	v_6 := '|';
	v_7 := Arg0;
	v_3 := STRINGSPLIT(v_7, v_6);
	v_1 := 0;
	label_18881:
	v_10 := v_3;
	v_9 := GETARRAYLENGTH(v_10);
	v_9 := v_9 - 1;
	v_8 := v_1 <= v_9;
	if not v_8 then goto label_20136;
	label_18959:
	v_11 := v_3[v_1];
	v_4 := GETCLASSKEYS(v_11);
	v_5 := 'PotPlayer.OpenWith';
	v_13 := 1;
	v_14 := v_3[v_1];
	v_15 := '%ext%';
	v_16 := &v_5;
	v_12 := STRINGCHANGEEX({var}v_16, v_15, v_14, v_13);
	v_18 := Arg1 = 0;
	if not v_18 then goto label_19435;
	label_19189:
	v_20 := v_5;
	v_23 := &v_4;
	v_23 := &v_23.0;
	v_23 := &v_23.1;
	v_22 := v_23;
	v_22 := v_22 + '\OpenWithProgids';
	v_21 := v_22;
	v_25 := &v_4;
	v_25 := &v_25.0;
	v_25 := &v_25.0;
	v_24 := v_25;
	v_19 := REGVALUEEXISTS(v_24, v_21, v_20);
	v_19 := not v_19;
	v_18 := v_18 and v_19;
	label_19435:
	v_17 := v_18;
	flag := not v_17;
	if flag then goto label_19714;
	label_19460:
	v_27 := '';
	v_28 := v_5;
	v_31 := &v_4;
	v_31 := &v_31.0;
	v_31 := &v_31.1;
	v_30 := v_31;
	v_30 := v_30 + '\OpenWithProgids';
	v_29 := v_30;
	v_33 := &v_4;
	v_33 := &v_33.0;
	v_33 := &v_33.0;
	v_32 := v_33;
	v_26 := REGWRITEBINARYVALUE(v_32, v_29, v_28, v_27);
	goto label_20125;
	label_19714:
	v_34 := Arg1 > 0;
	flag := not v_34;
	if flag then goto label_20125;
	label_19753:
	v_2 := 0;
	label_19773:
	v_37 := v_4;
	v_36 := GETARRAYLENGTH(v_37);
	v_36 := v_36 - 1;
	v_35 := v_2 <= v_36;
	if not v_35 then goto label_20124;
	label_19851:
	v_39 := v_5;
	v_42 := &v_4;
	v_43 := v_2;
	v_42 := &v_42.v_43;
	v_42 := &v_42.1;
	v_41 := v_42;
	v_41 := v_41 + '\OpenWithProgids';
	v_40 := v_41;
	v_45 := &v_4;
	v_46 := v_2;
	v_45 := &v_45.v_46;
	v_45 := &v_45.0;
	v_44 := v_45;
	v_38 := REGDELETEVALUE(v_44, v_40, v_39);
	inc(v_2);
	goto label_19773;
	label_20124:
	label_20125:
	inc(v_1);
	goto label_18881;
	label_20136:
	exit;
end;

procedure ADDOPENWITH(Arg0: UnicodeString);
var
	v_1: Integer;
	v_2: UnicodeString;
begin
	label_20138:
	v_1 := 0;
	v_2 := Arg0;
	MANAGEOPENWITH(v_2, v_1);
	exit;
end;

procedure ADDOPENWITH_APPEXTS();
var
	v_1: UnicodeString;
begin
	label_20182:
	v_1 := '3G2|3GP|3GP2|3GPP|AAC|AC3|AMR|AMV|APE|ASF|ASS|ASX|AVI|CUE|DIVX|DMSKM|DPG|DPL|DTS|DVR-MS|EVO|FLAC|FLV|IDX|IFO|K3G|LMP4|M1A|M1V|M2A|M2T|M2TS|M2V|M3U|M4A|M4B|M4P|M4V|MKA|MKV|MOD|MOV|MP2|MP2V|MP3|MP4|MPA|MPC|MPE|MPEG|MPG|MPLS|MPV2|MQV|MTS|NSR|NSV|OGG|OGM|OGV|PLS|QT|RA|RAM|RM|RMVB|RPM|SKM|SMI|SRT|SSA|SUB|SWF|TAK|TP|TPR|TRP|TS|VOB|WAV|WAX|WM|WMA|WMP|WMV|WMX|WVX|BIK|WEBM|WV|MXF';
	ADDOPENWITH(v_1);
	exit;
end;

procedure CURUNINSTALLSTEPCHANGED(Arg0: TUNINSTALLSTEP);
var
	v_1: BOOLEAN;
	v_2: Integer;
	v_3, v_4: UnicodeString;
begin
	label_20955:
	v_1 := Arg0 = 2;
	flag := not v_1;
	if flag then goto label_22556;
	label_20991:
	v_2 := 1;
	v_3 := '3G2|3GP|3GP2|3GPP|AAC|AC3|AMR|AMV|APE|ASF|ASS|ASX|AVI|CUE|DIVX|DMSKM|DPG|DPL|DTS|DVR-MS|EVO|FLAC|FLV|IDX|IFO|K3G|LMP4|M1A|M1V|M2A|M2T|M2TS|M2V|M3U|M4A|M4B|M4P|M4V|MKA|MKV|MOD|MOV|MP2|MP2V|MP3|MP4|MPA|MPC|MPE|MPEG|MPG|MPLS|MPV2|MQV|MTS|NSR|NSV|OGG|OGM|OGV|PLS|QT|RA|RAM|RM|RMVB|RPM|SKM|SMI|SRT|SSA|SUB|SWF|TAK|TP|TPR|TRP|TS|VOB|WAV|WAX|WM|WMA|WMP|WMV|WMX|WVX|BIK|WEBM|WV|MXF';
	MANAGEOPENWITH(v_3, v_2);
	v_4 := '3G2|3GP|3GP2|3GPP|AAC|AC3|AMR|AMV|APE|ASF|ASS|ASX|AVI|CUE|DIVX|DMSKM|DPG|DPL|DTS|DVR-MS|EVO|FLAC|FLV|IDX|IFO|K3G|LMP4|M1A|M1V|M2A|M2T|M2TS|M2V|M3U|M4A|M4B|M4P|M4V|MKA|MKV|MOD|MOV|MP2|MP2V|MP3|MP4|MPA|MPC|MPE|MPEG|MPG|MPLS|MPV2|MQV|MTS|NSR|NSV|OGG|OGM|OGV|PLS|QT|RA|RAM|RM|RMVB|RPM|SKM|SMI|SRT|SSA|SUB|SWF|TAK|TP|TPR|TRP|TS|VOB|WAV|WAX|WM|WMA|WMP|WMV|WMX|WVX|BIK|WEBM|WV|MXF';
	RESTOREEXTS(v_4);
	label_22556:
	exit;
end;

function INITIALIZESETUP(): BOOLEAN;
var
	v_1, v_5, v_9, v_13, v_17, v_21, v_25, v_29, v_33, v_37: BOOLEAN;
	v_2, v_3, v_4, v_6, v_7, v_8, v_10, v_11, v_12, v_14, v_15, v_16, v_18, v_19, v_20, v_22, v_23, v_24, v_26, v_27, v_28, v_30, v_31, v_32, v_34, v_35, v_36, v_38, v_39, v_40: UnicodeString;
begin
	label_22557:
	v_3 := '{tmp}\WizardImage1.bmp';
	v_2 := EXPANDCONSTANT(v_3);
	v_1 := FILEEXISTS(v_2);
	v_1 := not v_1;
	flag := not v_1;
	if flag then goto label_22734;
	label_22676:
	v_4 := 'WizardImage1.bmp';
	EXTRACTTEMPORARYFILE(v_4);
	label_22734:
	v_7 := '{tmp}\WizardImage2.bmp';
	v_6 := EXPANDCONSTANT(v_7);
	v_5 := FILEEXISTS(v_6);
	v_5 := not v_5;
	flag := not v_5;
	if flag then goto label_22911;
	label_22853:
	v_8 := 'WizardImage2.bmp';
	EXTRACTTEMPORARYFILE(v_8);
	label_22911:
	v_11 := '{tmp}\SetupImage1.bmp';
	v_10 := EXPANDCONSTANT(v_11);
	v_9 := FILEEXISTS(v_10);
	v_9 := not v_9;
	flag := not v_9;
	if flag then goto label_23084;
	label_23028:
	v_12 := 'SetupImage1.bmp';
	EXTRACTTEMPORARYFILE(v_12);
	label_23084:
	v_15 := '{tmp}\SetupImage2.bmp';
	v_14 := EXPANDCONSTANT(v_15);
	v_13 := FILEEXISTS(v_14);
	v_13 := not v_13;
	flag := not v_13;
	if flag then goto label_23257;
	label_23201:
	v_16 := 'SetupImage2.bmp';
	EXTRACTTEMPORARYFILE(v_16);
	label_23257:
	v_19 := '{tmp}\SVPImage1.bmp';
	v_18 := EXPANDCONSTANT(v_19);
	v_17 := FILEEXISTS(v_18);
	v_17 := not v_17;
	flag := not v_17;
	if flag then goto label_23422;
	label_23370:
	v_20 := 'SVPImage1.bmp';
	EXTRACTTEMPORARYFILE(v_20);
	label_23422:
	v_23 := '{tmp}\SVPImage2.bmp';
	v_22 := EXPANDCONSTANT(v_23);
	v_21 := FILEEXISTS(v_22);
	v_21 := not v_21;
	flag := not v_21;
	if flag then goto label_23587;
	label_23535:
	v_24 := 'SVPImage2.bmp';
	EXTRACTTEMPORARYFILE(v_24);
	label_23587:
	v_27 := '{tmp}\TORImage1.bmp';
	v_26 := EXPANDCONSTANT(v_27);
	v_25 := FILEEXISTS(v_26);
	v_25 := not v_25;
	flag := not v_25;
	if flag then goto label_23752;
	label_23700:
	v_28 := 'TORImage1.bmp';
	EXTRACTTEMPORARYFILE(v_28);
	label_23752:
	v_31 := '{tmp}\TORImage2.bmp';
	v_30 := EXPANDCONSTANT(v_31);
	v_29 := FILEEXISTS(v_30);
	v_29 := not v_29;
	flag := not v_29;
	if flag then goto label_23917;
	label_23865:
	v_32 := 'TORImage2.bmp';
	EXTRACTTEMPORARYFILE(v_32);
	label_23917:
	v_35 := '{tmp}\ACEImage1.bmp';
	v_34 := EXPANDCONSTANT(v_35);
	v_33 := FILEEXISTS(v_34);
	v_33 := not v_33;
	flag := not v_33;
	if flag then goto label_24082;
	label_24030:
	v_36 := 'ACEImage1.bmp';
	EXTRACTTEMPORARYFILE(v_36);
	label_24082:
	v_39 := '{tmp}\ACEImage2.bmp';
	v_38 := EXPANDCONSTANT(v_39);
	v_37 := FILEEXISTS(v_38);
	v_37 := not v_37;
	flag := not v_37;
	if flag then goto label_24247;
	label_24195:
	v_40 := 'ACEImage2.bmp';
	EXTRACTTEMPORARYFILE(v_40);
	label_24247:
	result := 1;
	exit;
end;

function CHECKPARAM(Arg0: UnicodeString): BOOLEAN;
var
	v_1, v_3, v_5: Integer;
	v_2, v_6: BOOLEAN;
	v_4: UnicodeString;
begin
	label_24260:
	v_1 := 0;
	label_24285:
	v_3 := PARAMCOUNT();
	v_2 := v_1 <= v_3;
	if not v_2 then goto label_24427;
	label_24330:
	v_5 := v_1;
	v_4 := PARAMSTR(v_5);
	result := v_4 = Arg0;
	v_6 := result;
	flag := not v_6;
	if flag then goto label_24416;
	label_24411:
	goto label_24427;
	label_24416:
	inc(v_1);
	goto label_24285;
	label_24427:
	exit;
end;

function FIXPOT(): BOOLEAN;
var
	v_1: Integer;
	v_2: TBITMAPIMAGE;
	v_3: TWIZARDFORM;
	v_4: BOOLEAN;
	v_5: UnicodeString;
begin
	label_24429:
	v_3 := WIZARDFORM();
	v_2 := v_3.WIZARDSMALLBITMAPIMAGE;
	v_1 := v_2.TAG;
	result := v_1 = 1;
	if result then goto label_24569;
	label_24514:
	v_5 := '/T';
	v_4 := CHECKPARAM(v_5);
	result := result or v_4;
	label_24569:
	exit;
end;

function CLEAN(): BOOLEAN;
var
	v_1: TNEWCHECKBOX;
	v_2: BOOLEAN;
	v_3: UnicodeString;
begin
	label_24570:
	v_1 := gvar_2;
	result := v_1.CHECKED;
	if result then goto label_24664;
	label_24609:
	v_3 := '/C';
	v_2 := CHECKPARAM(v_3);
	result := result or v_2;
	label_24664:
	exit;
end;

function DEFAULT(): BOOLEAN;
var
	v_1: TNEWRADIOBUTTON;
begin
	label_24665:
	v_1 := gvar_0;
	result := v_1.CHECKED;
	exit;
end;

function PORTABLE(): BOOLEAN;
var
	v_1: TNEWRADIOBUTTON;
	v_2: BOOLEAN;
	v_3: UnicodeString;
begin
	label_24695:
	v_1 := gvar_1;
	result := v_1.CHECKED;
	if result then goto label_24789;
	label_24734:
	v_3 := '/P';
	v_2 := CHECKPARAM(v_3);
	result := result or v_2;
	label_24789:
	exit;
end;

function CHSVP(): BOOLEAN;
var
	v_1: TNEWCHECKBOX;
	v_2: BOOLEAN;
	v_3: UnicodeString;
begin
	label_24790:
	v_1 := gvar_3;
	result := v_1.CHECKED;
	if result then goto label_24888;
	label_24829:
	v_3 := '/SVP';
	v_2 := CHECKPARAM(v_3);
	result := result or v_2;
	label_24888:
	exit;
end;

function CHTORRENT(): BOOLEAN;
var
	v_1: TNEWCHECKBOX;
	v_2: BOOLEAN;
	v_3: UnicodeString;
begin
	label_24889:
	v_1 := gvar_4;
	result := v_1.CHECKED;
	if result then goto label_24987;
	label_24928:
	v_3 := '/TOR';
	v_2 := CHECKPARAM(v_3);
	result := result or v_2;
	label_24987:
	exit;
end;

function CHACE(): BOOLEAN;
var
	v_1: TNEWCHECKBOX;
	v_2: BOOLEAN;
	v_3: UnicodeString;
begin
	label_24988:
	v_1 := gvar_5;
	result := v_1.CHECKED;
	if result then goto label_25086;
	label_25027:
	v_3 := '/ACE';
	v_2 := CHECKPARAM(v_3);
	result := result or v_2;
	label_25086:
	exit;
end;

function SHORTCUT(): BOOLEAN;
var
	v_1: TNEWCHECKBOX;
	v_2: BOOLEAN;
	v_3: UnicodeString;
begin
	label_25087:
	v_1 := gvar_6;
	result := v_1.CHECKED;
	if result then goto label_25181;
	label_25126:
	v_3 := '/S';
	v_2 := CHECKPARAM(v_3);
	result := result or v_2;
	label_25181:
	exit;
end;

procedure PROGRESS();
var
	v_1: Pointer;
	v_2, v_11, v_13, v_15, v_17: TNEWPROGRESSBAR;
	v_3: TWIZARDFORM;
	v_4, v_6, v_7, v_8: UnicodeString;
	v_5: UnicodeString;
	v_9: Int64;
	v_10, v_12, v_14, v_16: Integer;
	v_18: TLABEL;
begin
	label_25182:
	v_3 := WIZARDFORM();
	v_2 := v_3.PROGRESSGAUGE;
	v_1 := &v_2;
	v_7 := '{cm:progress} ';
	v_6 := EXPANDCONSTANT(v_7);
	v_5 := v_6;
	v_11 := v_1;
	v_10 := v_11.POSITION;
	v_13 := v_1;
	v_12 := v_13.MIN;
	v_10 := v_10 - v_12;
	v_15 := v_1;
	v_14 := v_15.MAX;
	v_17 := v_1;
	v_16 := v_17.MIN;
	v_14 := v_14 - v_16;
	v_14 := v_14 / 100;
	v_10 := v_10 / v_14;
	v_9 := v_10;
	v_8 := INTTOSTR(v_9);
	v_5 := v_5 + v_8;
	v_5 := v_5 + '%';
	v_4 := v_5;
	v_18 := gvar_9;
	v_18.CAPTION := v_4;
	exit;
end;

procedure SETUPCLICK1(Arg0: TOBJECT);
var
	v_1, v_31: BOOLEAN;
	v_2, v_6, v_15, v_16, v_19, v_20, v_23, v_24, v_27, v_28, v_32, v_36, v_45, v_46, v_49, v_50, v_53, v_54, v_57, v_58: Integer;
	v_3, v_7, v_13, v_17, v_21, v_25, v_29, v_33, v_37, v_43, v_47, v_51, v_55, v_59: TBITMAPIMAGE;
	v_4, v_8, v_34, v_38: Cardinal;
	v_5, v_9, v_35, v_39: TOBJECT;
	v_10, v_11, v_40, v_41: UnicodeString;
	v_12, v_42: TALPHABITMAP;
	v_14, v_18, v_22, v_26, v_30, v_44, v_48, v_52, v_56, v_60: TWIZARDFORM;
begin
	label_25612:
	v_4 := 38;
	v_5 := Arg0;
	Proc65();
	v_2 := v_3.TAG;
	v_1 := v_2 = 0;
	flag := not v_1;
	if flag then goto label_26274;
	label_25725:
	v_6 := 1;
	v_8 := 38;
	v_9 := Arg0;
	Proc65();
	v_7.TAG := v_6;
	v_11 := '{tmp}\WizardImage1.bmp';
	v_10 := EXPANDCONSTANT(v_11);
	v_14 := WIZARDFORM();
	v_13 := v_14.WIZARDSMALLBITMAPIMAGE;
	v_12 := v_13.BITMAP;
	v_12.LOADFROMFILE(v_10);
	v_16 := 441;
	v_15 := SCALEX(v_16);
	v_18 := WIZARDFORM();
	v_17 := v_18.WIZARDSMALLBITMAPIMAGE;
	v_17.LEFT := v_15;
	v_20 := 3;
	v_19 := SCALEY(v_20);
	v_22 := WIZARDFORM();
	v_21 := v_22.WIZARDSMALLBITMAPIMAGE;
	v_21.TOP := v_19;
	v_24 := 52;
	v_23 := SCALEX(v_24);
	v_26 := WIZARDFORM();
	v_25 := v_26.WIZARDSMALLBITMAPIMAGE;
	v_25.WIDTH := v_23;
	v_28 := 52;
	v_27 := SCALEY(v_28);
	v_30 := WIZARDFORM();
	v_29 := v_30.WIZARDSMALLBITMAPIMAGE;
	v_29.HEIGHT := v_27;
	goto label_26931;
	label_26274:
	v_34 := 38;
	v_35 := Arg0;
	Proc65();
	v_32 := v_33.TAG;
	v_31 := v_32 = 1;
	flag := not v_31;
	if flag then goto label_26931;
	label_26387:
	v_36 := 0;
	v_38 := 38;
	v_39 := Arg0;
	Proc65();
	v_37.TAG := v_36;
	v_41 := '{tmp}\WizardImage2.bmp';
	v_40 := EXPANDCONSTANT(v_41);
	v_44 := WIZARDFORM();
	v_43 := v_44.WIZARDSMALLBITMAPIMAGE;
	v_42 := v_43.BITMAP;
	v_42.LOADFROMFILE(v_40);
	v_46 := 441;
	v_45 := SCALEX(v_46);
	v_48 := WIZARDFORM();
	v_47 := v_48.WIZARDSMALLBITMAPIMAGE;
	v_47.LEFT := v_45;
	v_50 := 3;
	v_49 := SCALEY(v_50);
	v_52 := WIZARDFORM();
	v_51 := v_52.WIZARDSMALLBITMAPIMAGE;
	v_51.TOP := v_49;
	v_54 := 52;
	v_53 := SCALEX(v_54);
	v_56 := WIZARDFORM();
	v_55 := v_56.WIZARDSMALLBITMAPIMAGE;
	v_55.WIDTH := v_53;
	v_58 := 52;
	v_57 := SCALEY(v_58);
	v_60 := WIZARDFORM();
	v_59 := v_60.WIZARDSMALLBITMAPIMAGE;
	v_59.HEIGHT := v_57;
	label_26931:
	exit;
end;

procedure SETUPCLICK3(Arg0: TOBJECT);
var
	v_1, v_13: BOOLEAN;
	v_2, v_14: TNEWCHECKBOX;
	v_3, v_4, v_15, v_16: UnicodeString;
	v_5, v_17: TALPHABITMAP;
	v_6, v_9, v_12, v_18, v_21, v_24: TBITMAPIMAGE;
	v_7, v_8, v_10, v_11, v_19, v_20, v_22, v_23: Integer;
begin
	label_26932:
	v_2 := gvar_3;
	v_1 := v_2.CHECKED;
	v_1 := not v_1;
	flag := not v_1;
	if flag then goto label_27224;
	label_26985:
	v_4 := '{tmp}\SVPImage1.bmp';
	v_3 := EXPANDCONSTANT(v_4);
	v_6 := gvar_13;
	v_5 := v_6.BITMAP;
	v_5.LOADFROMFILE(v_3);
	v_8 := 390;
	v_7 := SCALEX(v_8);
	v_9 := gvar_13;
	v_9.LEFT := v_7;
	v_11 := 198;
	v_10 := SCALEY(v_11);
	v_12 := gvar_13;
	v_12.TOP := v_10;
	label_27224:
	v_14 := gvar_3;
	v_13 := v_14.CHECKED;
	flag := not v_13;
	if flag then goto label_27510;
	label_27271:
	v_16 := '{tmp}\SVPImage2.bmp';
	v_15 := EXPANDCONSTANT(v_16);
	v_18 := gvar_13;
	v_17 := v_18.BITMAP;
	v_17.LOADFROMFILE(v_15);
	v_20 := 390;
	v_19 := SCALEX(v_20);
	v_21 := gvar_13;
	v_21.LEFT := v_19;
	v_23 := 198;
	v_22 := SCALEY(v_23);
	v_24 := gvar_13;
	v_24.TOP := v_22;
	label_27510:
	exit;
end;

procedure SETUPCLICK4(Arg0: TOBJECT);
var
	v_1, v_13: BOOLEAN;
	v_2, v_14: TNEWCHECKBOX;
	v_3, v_4, v_15, v_16: UnicodeString;
	v_5, v_17: TALPHABITMAP;
	v_6, v_9, v_12, v_18, v_21, v_24: TBITMAPIMAGE;
	v_7, v_8, v_10, v_11, v_19, v_20, v_22, v_23: Integer;
begin
	label_27511:
	v_2 := gvar_4;
	v_1 := v_2.CHECKED;
	v_1 := not v_1;
	flag := not v_1;
	if flag then goto label_27803;
	label_27564:
	v_4 := '{tmp}\TORImage1.bmp';
	v_3 := EXPANDCONSTANT(v_4);
	v_6 := gvar_14;
	v_5 := v_6.BITMAP;
	v_5.LOADFROMFILE(v_3);
	v_8 := 370;
	v_7 := SCALEX(v_8);
	v_9 := gvar_14;
	v_9.LEFT := v_7;
	v_11 := 198;
	v_10 := SCALEY(v_11);
	v_12 := gvar_14;
	v_12.TOP := v_10;
	label_27803:
	v_14 := gvar_4;
	v_13 := v_14.CHECKED;
	flag := not v_13;
	if flag then goto label_28089;
	label_27850:
	v_16 := '{tmp}\TORImage2.bmp';
	v_15 := EXPANDCONSTANT(v_16);
	v_18 := gvar_14;
	v_17 := v_18.BITMAP;
	v_17.LOADFROMFILE(v_15);
	v_20 := 370;
	v_19 := SCALEX(v_20);
	v_21 := gvar_14;
	v_21.LEFT := v_19;
	v_23 := 198;
	v_22 := SCALEY(v_23);
	v_24 := gvar_14;
	v_24.TOP := v_22;
	label_28089:
	exit;
end;

procedure SETUPCLICK5(Arg0: TOBJECT);
var
	v_1, v_13: BOOLEAN;
	v_2, v_14: TNEWCHECKBOX;
	v_3, v_4, v_15, v_16: UnicodeString;
	v_5, v_17: TALPHABITMAP;
	v_6, v_9, v_12, v_18, v_21, v_24: TBITMAPIMAGE;
	v_7, v_8, v_10, v_11, v_19, v_20, v_22, v_23: Integer;
begin
	label_28090:
	v_2 := gvar_5;
	v_1 := v_2.CHECKED;
	v_1 := not v_1;
	flag := not v_1;
	if flag then goto label_28382;
	label_28143:
	v_4 := '{tmp}\ACEImage1.bmp';
	v_3 := EXPANDCONSTANT(v_4);
	v_6 := gvar_15;
	v_5 := v_6.BITMAP;
	v_5.LOADFROMFILE(v_3);
	v_8 := 350;
	v_7 := SCALEX(v_8);
	v_9 := gvar_15;
	v_9.LEFT := v_7;
	v_11 := 198;
	v_10 := SCALEY(v_11);
	v_12 := gvar_15;
	v_12.TOP := v_10;
	label_28382:
	v_14 := gvar_5;
	v_13 := v_14.CHECKED;
	flag := not v_13;
	if flag then goto label_28668;
	label_28429:
	v_16 := '{tmp}\ACEImage2.bmp';
	v_15 := EXPANDCONSTANT(v_16);
	v_18 := gvar_15;
	v_17 := v_18.BITMAP;
	v_17.LOADFROMFILE(v_15);
	v_20 := 350;
	v_19 := SCALEX(v_20);
	v_21 := gvar_15;
	v_21.LEFT := v_19;
	v_23 := 198;
	v_22 := SCALEY(v_23);
	v_24 := gvar_15;
	v_24.TOP := v_22;
	label_28668:
	exit;
end;

procedure SETUPCLICK2(Arg0: TOBJECT);
var
	v_1: TNEWRADIOBUTTON;
	v_2: Cardinal;
	v_3: TOBJECT;
	v_4: BOOLEAN;
	v_5, v_6, v_9, v_10, v_19, v_21, v_22, v_23, v_26, v_27: UnicodeString;
	v_7, v_24: TEDIT;
	v_8, v_25: TWIZARDFORM;
	v_11, v_28: TALPHABITMAP;
	v_12, v_15, v_18, v_29, v_32, v_35: TBITMAPIMAGE;
	v_13, v_14, v_16, v_17, v_30, v_31, v_33, v_34: Integer;
	v_20: UnicodeString;
begin
	label_28669:
	v_2 := 34;
	v_3 := Arg0;
	Proc65();
	v_4 := gvar_0 = v_1;
	if not v_4 then goto label_29112;
	label_28756:
	v_6 := '{pf}\PotPlayer';
	v_5 := EXPANDCONSTANT(v_6);
	v_8 := WIZARDFORM();
	v_7 := v_8.DIREDIT;
	v_7.TEXT := v_5;
	v_10 := '{tmp}\SetupImage1.bmp';
	v_9 := EXPANDCONSTANT(v_10);
	v_12 := gvar_12;
	v_11 := v_12.BITMAP;
	v_11.LOADFROMFILE(v_9);
	v_14 := 343;
	v_13 := SCALEX(v_14);
	v_15 := gvar_12;
	v_15.LEFT := v_13;
	v_17 := 122;
	v_16 := SCALEY(v_17);
	v_18 := gvar_12;
	v_18.TOP := v_16;
	goto label_29589;
	label_29112:
	v_4 := gvar_1 = v_1;
	if not v_4 then goto label_29589;
	label_29139:
	v_23 := '{src}';
	v_22 := EXPANDCONSTANT(v_23);
	v_21 := ADDBACKSLASH(v_22);
	v_20 := v_21;
	v_20 := v_20 + 'PotPlayer1.7.14804.x86';
	v_19 := v_20;
	v_25 := WIZARDFORM();
	v_24 := v_25.DIREDIT;
	v_24.TEXT := v_19;
	v_27 := '{tmp}\SetupImage2.bmp';
	v_26 := EXPANDCONSTANT(v_27);
	v_29 := gvar_12;
	v_28 := v_29.BITMAP;
	v_28.LOADFROMFILE(v_26);
	v_31 := 343;
	v_30 := SCALEX(v_31);
	v_32 := gvar_12;
	v_32.LEFT := v_30;
	v_34 := 122;
	v_33 := SCALEY(v_34);
	v_35 := gvar_12;
	v_35.TOP := v_33;
	goto label_29589;
	label_29589:
	exit;
end;

procedure INITIALIZEWIZARD();
var
	v_1, v_26, v_28, v_30, v_32, v_39, v_100, v_104, v_107, v_110, v_117, v_121, v_124, v_127, v_130, v_133, v_139, v_141, v_145, v_148, v_151, v_154, v_157, v_163, v_165, v_169, v_172, v_175, v_178, v_181, v_187, v_189, v_193, v_196, v_199, v_202, v_205: TBITMAPIMAGE;
	v_2, v_14, v_16, v_18, v_20, v_34, v_36, v_38: TFORM;
	v_3, v_5, v_6, v_7, v_24, v_102, v_103, v_116, v_138, v_162, v_186, v_214, v_215, v_237, v_238, v_272, v_273, v_276, v_298, v_299, v_302, v_329, v_330, v_333, v_360, v_361, v_364, v_391, v_392, v_395, v_417, v_418, v_446, v_447, v_452: UnicodeString;
	v_4, v_17, v_19, v_37, v_59, v_60, v_62, v_63, v_65, v_66, v_68, v_69, v_79, v_81, v_83, v_84, v_86, v_99, v_122, v_123, v_125, v_126, v_128, v_129, v_131, v_132, v_140, v_146, v_147, v_149, v_150, v_152, v_153, v_155, v_156, v_164, v_170, v_171, v_173, v_174, v_176, v_177, v_179, v_180, v_188, v_194, v_195, v_197, v_198, v_200, v_201, v_203, v_204, v_217, v_218, v_220, v_221, v_223, v_224, v_226, v_227, v_240, v_241, v_243, v_244, v_246, v_247, v_249, v_250, v_260, v_261, v_263, v_264, v_266, v_267, v_269, v_270, v_286, v_287, v_289, v_290, v_292, v_293, v_295, v_296, v_317, v_318, v_320, v_321, v_323, v_324, v_326, v_327, v_348, v_349, v_351, v_352, v_354, v_355, v_357, v_358, v_379, v_380, v_382, v_383, v_385, v_386, v_388, v_389, v_405, v_406, v_408, v_409, v_411, v_412, v_414, v_415, v_424, v_434, v_435, v_437, v_438, v_440, v_441, v_443, v_444: Integer;
	v_8, v_9, v_21, v_51, v_73, v_95, v_112, v_134, v_158, v_182, v_206, v_229, v_252, v_278, v_309, v_340, v_371, v_397, v_426: TCOMPONENT;
	v_10, v_12, v_23, v_33, v_54, v_76, v_98, v_115, v_137, v_161, v_185, v_209, v_232, v_255, v_281, v_312, v_343, v_374, v_400, v_429: Pointer;
	v_11, v_22, v_53, v_75, v_97, v_114, v_136, v_160, v_184, v_208, v_231, v_254, v_280, v_307, v_311, v_338, v_342, v_369, v_373, v_399, v_428: Cardinal;
	v_13: TFORMBORDERSTYLE;
	v_15: TPOSITION;
	v_25: TALPHABITMAP;
	v_27, v_35, v_89, v_106, v_275, v_301, v_306, v_332, v_337, v_363, v_368, v_394, v_422, v_451: BOOLEAN;
	v_29: TALIGN;
	v_31, v_55, v_91, v_118, v_142, v_166, v_190, v_210, v_233, v_256, v_282, v_313, v_344, v_375, v_401, v_430: TWINCONTROL;
	v_40, v_42, v_44, v_46, v_48, v_50, v_52, v_57, v_74, v_78, v_93, v_96, v_101, v_105, v_108, v_111, v_113, v_120, v_135, v_144, v_159, v_168, v_183, v_192, v_207, v_212, v_230, v_235, v_253, v_258, v_279, v_284, v_310, v_315, v_341, v_346, v_372, v_377, v_398, v_403, v_427, v_432: TWIZARDFORM;
	v_41, v_43, v_45, v_47, v_49, v_77, v_80, v_82, v_87: TNEWSTATICTEXT;
	v_56, v_92, v_119, v_143, v_167, v_191, v_211, v_234, v_257, v_283, v_314, v_345, v_376, v_402, v_431: TNEWNOTEBOOKPAGE;
	v_58, v_61, v_64, v_67, v_70, v_72: TBEVEL;
	v_71: TBEVELSHAPE;
	v_85, v_88, v_90, v_94, v_213, v_216, v_219, v_222, v_225, v_228, v_236, v_239, v_242, v_245, v_248, v_251: TLABEL;
	v_109, v_304, v_335, v_366, v_420, v_449: TNOTIFYEVENT;
	v_259, v_262, v_265, v_268, v_271, v_274, v_277, v_285, v_288, v_291, v_294, v_297, v_300, v_303, v_305, v_308, v_316, v_319, v_322, v_325, v_328, v_331, v_334, v_336, v_339, v_347, v_350, v_353, v_356, v_359, v_362, v_365, v_367, v_370, v_378, v_381, v_384, v_387, v_390, v_393, v_396: TNEWCHECKBOX;
	v_404, v_407, v_410, v_413, v_416, v_419, v_421, v_423, v_425, v_433, v_436, v_439, v_442, v_445, v_448, v_450, v_453: TNEWRADIOBUTTON;
begin
	label_29592:
	v_5 := '{tmp}\Splash.bmp';
	v_3 := EXPANDCONSTANT(v_5);
	v_7 := v_3;
	v_6 := EXTRACTFILENAME(v_7);
	EXTRACTTEMPORARYFILE(v_6);
	v_10 := &v_9;
	Proc84();
	v_8 := v_9;
	v_11 := 44;
	v_2 := v_11.CREATE(v_8);
	v_12 := &v_2;
	v_13 := 0;
	v_14 := v_12;
	v_14.BORDERSTYLE := v_13;
	v_15 := 4;
	v_16 := v_12;
	v_16.POSITION := v_15;
	v_17 := 320;
	v_18 := v_12;
	v_18.CLIENTWIDTH := v_17;
	v_19 := 200;
	v_20 := v_12;
	v_20.CLIENTHEIGHT := v_19;
	v_21 := v_2;
	v_22 := 38;
	v_1 := v_22.CREATE(v_21);
	v_23 := &v_1;
	v_24 := v_3;
	v_26 := v_23;
	v_25 := v_26.BITMAP;
	v_25.LOADFROMFILE(v_24);
	v_27 := 0;
	v_28 := v_23;
	v_28.STRETCH := v_27;
	v_29 := 5;
	v_30 := v_23;
	v_30.ALIGN := v_29;
	v_31 := v_2;
	v_32 := v_23;
	v_32.PARENT := v_31;
	v_33 := &v_2;
	v_34 := v_33;
	v_34.SHOW();
	v_4 := 1;
	label_30279:
	v_35 := v_4 <= 1;
	if not v_35 then goto label_30369;
	label_30310:
	v_36 := v_33;
	v_36.REPAINT();
	v_37 := 1000;
	SLEEP(v_37);
	inc(v_4);
	goto label_30279;
	label_30369:
	v_38 := v_33;
	v_38.CLOSE();
	v_40 := WIZARDFORM();
	v_39 := v_40.SELECTDIRBITMAPIMAGE;
	v_39.HIDE();
	v_42 := WIZARDFORM();
	v_41 := v_42.SELECTDIRLABEL;
	v_41.HIDE();
	v_44 := WIZARDFORM();
	v_43 := v_44.SELECTDIRBROWSELABEL;
	v_43.HIDE();
	v_46 := WIZARDFORM();
	v_45 := v_46.DISKSPACELABEL;
	v_45.HIDE();
	v_48 := WIZARDFORM();
	v_47 := v_48.FILENAMELABEL;
	v_47.HIDE();
	v_50 := WIZARDFORM();
	v_49 := v_50.SELECTTASKSLABEL;
	v_49.HIDE();
	v_52 := WIZARDFORM();
	v_51 := v_52;
	v_53 := 37;
	gvar_10 := v_53.CREATE(v_51);
	v_54 := &gvar_10;
	v_57 := WIZARDFORM();
	v_56 := v_57.SELECTTASKSPAGE;
	v_55 := v_56;
	v_58 := v_54;
	v_58.PARENT := v_55;
	v_60 := -5;
	v_59 := SCALEX(v_60);
	v_61 := v_54;
	v_61.LEFT := v_59;
	v_63 := 0;
	v_62 := SCALEY(v_63);
	v_64 := v_54;
	v_64.TOP := v_62;
	v_66 := 427;
	v_65 := SCALEX(v_66);
	v_67 := v_54;
	v_67.WIDTH := v_65;
	v_69 := 34;
	v_68 := SCALEY(v_69);
	v_70 := v_54;
	v_70.HEIGHT := v_68;
	v_71 := 1;
	v_72 := v_54;
	v_72.SHAPE := v_71;
	v_74 := WIZARDFORM();
	v_73 := v_74;
	v_75 := 36;
	gvar_9 := v_75.CREATE(v_73);
	v_78 := WIZARDFORM();
	v_77 := v_78.FILENAMELABEL;
	v_76 := &v_77;
	v_80 := v_76;
	v_79 := v_80.TOP;
	v_82 := v_76;
	v_81 := v_82.HEIGHT;
	v_79 := v_79 + v_81;
	v_84 := -13;
	v_83 := SCALEY(v_84);
	v_79 := v_79 + v_83;
	v_85 := gvar_9;
	v_85.TOP := v_79;
	v_87 := v_76;
	v_86 := v_87.LEFT;
	v_88 := gvar_9;
	v_88.LEFT := v_86;
	v_89 := 1;
	v_90 := gvar_9;
	v_90.AUTOSIZE := v_89;
	v_93 := WIZARDFORM();
	v_92 := v_93.INSTALLINGPAGE;
	v_91 := v_92;
	v_94 := gvar_9;
	v_94.PARENT := v_91;
	v_96 := WIZARDFORM();
	v_95 := v_96;
	v_97 := 38;
	gvar_11 := v_97.CREATE(v_95);
	v_98 := &gvar_11;
	v_99 := -21;
	v_101 := WIZARDFORM();
	v_100 := v_101.WIZARDSMALLBITMAPIMAGE;
	v_100.CURSOR := v_99;
	v_103 := '{cm:SetupImageHint}';
	v_102 := EXPANDCONSTANT(v_103);
	v_105 := WIZARDFORM();
	v_104 := v_105.WIZARDSMALLBITMAPIMAGE;
	v_104.HINT := v_102;
	v_106 := 1;
	v_108 := WIZARDFORM();
	v_107 := v_108.WIZARDSMALLBITMAPIMAGE;
	v_107.SHOWHINT := v_106;
	v_109 := procedure SETUPCLICK1(Arg0: TOBJECT);;
	v_111 := WIZARDFORM();
	v_110 := v_111.WIZARDSMALLBITMAPIMAGE;
	v_110.ONCLICK := v_109;
	v_113 := WIZARDFORM();
	v_112 := v_113;
	v_114 := 38;
	gvar_12 := v_114.CREATE(v_112);
	v_115 := &gvar_12;
	v_116 := 'SetupBitmapImage';
	v_117 := v_115;
	v_117.NAME := v_116;
	v_120 := WIZARDFORM();
	v_119 := v_120.SELECTDIRPAGE;
	v_118 := v_119;
	v_121 := v_115;
	v_121.PARENT := v_118;
	v_123 := 343;
	v_122 := SCALEX(v_123);
	v_124 := v_115;
	v_124.LEFT := v_122;
	v_126 := 122;
	v_125 := SCALEY(v_126);
	v_127 := v_115;
	v_127.TOP := v_125;
	v_129 := 73;
	v_128 := SCALEX(v_129);
	v_130 := v_115;
	v_130.WIDTH := v_128;
	v_132 := 98;
	v_131 := SCALEY(v_132);
	v_133 := v_115;
	v_133.HEIGHT := v_131;
	v_135 := WIZARDFORM();
	v_134 := v_135;
	v_136 := 38;
	gvar_13 := v_136.CREATE(v_134);
	v_137 := &gvar_13;
	v_138 := 'SVPImage';
	v_139 := v_137;
	v_139.NAME := v_138;
	v_140 := 16777215;
	v_141 := v_137;
	v_141.BACKCOLOR := v_140;
	v_144 := WIZARDFORM();
	v_143 := v_144.SELECTDIRPAGE;
	v_142 := v_143;
	v_145 := v_137;
	v_145.PARENT := v_142;
	v_147 := 390;
	v_146 := SCALEX(v_147);
	v_148 := v_137;
	v_148.LEFT := v_146;
	v_150 := 198;
	v_149 := SCALEY(v_150);
	v_151 := v_137;
	v_151.TOP := v_149;
	v_153 := 18;
	v_152 := SCALEX(v_153);
	v_154 := v_137;
	v_154.WIDTH := v_152;
	v_156 := 18;
	v_155 := SCALEY(v_156);
	v_157 := v_137;
	v_157.HEIGHT := v_155;
	v_159 := WIZARDFORM();
	v_158 := v_159;
	v_160 := 38;
	gvar_14 := v_160.CREATE(v_158);
	v_161 := &gvar_14;
	v_162 := 'TORImage';
	v_163 := v_161;
	v_163.NAME := v_162;
	v_164 := 16777215;
	v_165 := v_161;
	v_165.BACKCOLOR := v_164;
	v_168 := WIZARDFORM();
	v_167 := v_168.SELECTDIRPAGE;
	v_166 := v_167;
	v_169 := v_161;
	v_169.PARENT := v_166;
	v_171 := 370;
	v_170 := SCALEX(v_171);
	v_172 := v_161;
	v_172.LEFT := v_170;
	v_174 := 198;
	v_173 := SCALEY(v_174);
	v_175 := v_161;
	v_175.TOP := v_173;
	v_177 := 18;
	v_176 := SCALEX(v_177);
	v_178 := v_161;
	v_178.WIDTH := v_176;
	v_180 := 18;
	v_179 := SCALEY(v_180);
	v_181 := v_161;
	v_181.HEIGHT := v_179;
	v_183 := WIZARDFORM();
	v_182 := v_183;
	v_184 := 38;
	gvar_15 := v_184.CREATE(v_182);
	v_185 := &gvar_15;
	v_186 := 'ACEImage';
	v_187 := v_185;
	v_187.NAME := v_186;
	v_188 := 16777215;
	v_189 := v_185;
	v_189.BACKCOLOR := v_188;
	v_192 := WIZARDFORM();
	v_191 := v_192.SELECTDIRPAGE;
	v_190 := v_191;
	v_193 := v_185;
	v_193.PARENT := v_190;
	v_195 := 350;
	v_194 := SCALEX(v_195);
	v_196 := v_185;
	v_196.LEFT := v_194;
	v_198 := 198;
	v_197 := SCALEY(v_198);
	v_199 := v_185;
	v_199.TOP := v_197;
	v_201 := 18;
	v_200 := SCALEX(v_201);
	v_202 := v_185;
	v_202.WIDTH := v_200;
	v_204 := 18;
	v_203 := SCALEY(v_204);
	v_205 := v_185;
	v_205.HEIGHT := v_203;
	v_207 := WIZARDFORM();
	v_206 := v_207;
	v_208 := 36;
	gvar_7 := v_208.CREATE(v_206);
	v_209 := &gvar_7;
	v_212 := WIZARDFORM();
	v_211 := v_212.SELECTDIRPAGE;
	v_210 := v_211;
	v_213 := v_209;
	v_213.PARENT := v_210;
	v_215 := '{cm:HeaderLabel1}';
	v_214 := EXPANDCONSTANT(v_215);
	v_216 := v_209;
	v_216.CAPTION := v_214;
	v_218 := 0;
	v_217 := SCALEX(v_218);
	v_219 := v_209;
	v_219.LEFT := v_217;
	v_221 := 4;
	v_220 := SCALEY(v_221);
	v_222 := v_209;
	v_222.TOP := v_220;
	v_224 := 200;
	v_223 := SCALEX(v_224);
	v_225 := v_209;
	v_225.WIDTH := v_223;
	v_227 := 17;
	v_226 := SCALEY(v_227);
	v_228 := v_209;
	v_228.HEIGHT := v_226;
	v_230 := WIZARDFORM();
	v_229 := v_230;
	v_231 := 36;
	gvar_8 := v_231.CREATE(v_229);
	v_232 := &gvar_8;
	v_235 := WIZARDFORM();
	v_234 := v_235.SELECTDIRPAGE;
	v_233 := v_234;
	v_236 := v_232;
	v_236.PARENT := v_233;
	v_238 := '{cm:HeaderLabel2}';
	v_237 := EXPANDCONSTANT(v_238);
	v_239 := v_232;
	v_239.CAPTION := v_237;
	v_241 := 0;
	v_240 := SCALEX(v_241);
	v_242 := v_232;
	v_242.LEFT := v_240;
	v_244 := 119;
	v_243 := SCALEY(v_244);
	v_245 := v_232;
	v_245.TOP := v_243;
	v_247 := 200;
	v_246 := SCALEX(v_247);
	v_248 := v_232;
	v_248.WIDTH := v_246;
	v_250 := 17;
	v_249 := SCALEY(v_250);
	v_251 := v_232;
	v_251.HEIGHT := v_249;
	v_253 := WIZARDFORM();
	v_252 := v_253;
	v_254 := 35;
	gvar_2 := v_254.CREATE(v_252);
	v_255 := &gvar_2;
	v_258 := WIZARDFORM();
	v_257 := v_258.SELECTTASKSPAGE;
	v_256 := v_257;
	v_259 := v_255;
	v_259.PARENT := v_256;
	v_261 := 4;
	v_260 := SCALEX(v_261);
	v_262 := v_255;
	v_262.LEFT := v_260;
	v_264 := 8;
	v_263 := SCALEY(v_264);
	v_265 := v_255;
	v_265.TOP := v_263;
	v_267 := 400;
	v_266 := SCALEX(v_267);
	v_268 := v_255;
	v_268.WIDTH := v_266;
	v_270 := 17;
	v_269 := SCALEY(v_270);
	v_271 := v_255;
	v_271.HEIGHT := v_269;
	v_273 := '{cm:SetupCaption0}';
	v_272 := EXPANDCONSTANT(v_273);
	v_274 := v_255;
	v_274.CAPTION := v_272;
	v_276 := '/C';
	v_275 := CHECKPARAM(v_276);
	v_277 := v_255;
	v_277.CHECKED := v_275;
	v_279 := WIZARDFORM();
	v_278 := v_279;
	v_280 := 35;
	gvar_3 := v_280.CREATE(v_278);
	v_281 := &gvar_3;
	v_284 := WIZARDFORM();
	v_283 := v_284.SELECTDIRPAGE;
	v_282 := v_283;
	v_285 := v_281;
	v_285.PARENT := v_282;
	v_287 := 5;
	v_286 := SCALEX(v_287);
	v_288 := v_281;
	v_288.LEFT := v_286;
	v_290 := 139;
	v_289 := SCALEY(v_290);
	v_291 := v_281;
	v_291.TOP := v_289;
	v_293 := 310;
	v_292 := SCALEX(v_293);
	v_294 := v_281;
	v_294.WIDTH := v_292;
	v_296 := 17;
	v_295 := SCALEY(v_296);
	v_297 := v_281;
	v_297.HEIGHT := v_295;
	v_299 := '{cm:SetupCaption3}';
	v_298 := EXPANDCONSTANT(v_299);
	v_300 := v_281;
	v_300.CAPTION := v_298;
	v_302 := '/SVP';
	v_301 := CHECKPARAM(v_302);
	v_303 := v_281;
	v_303.CHECKED := v_301;
	v_304 := procedure SETUPCLICK3(Arg0: TOBJECT);;
	v_305 := v_281;
	v_305.ONCLICK := v_304;
	v_307 := GETWINDOWSVERSION();
	v_306 := v_307 > 100728832;
	v_308 := v_281;
	v_308.ENABLED := v_306;
	v_310 := WIZARDFORM();
	v_309 := v_310;
	v_311 := 35;
	gvar_4 := v_311.CREATE(v_309);
	v_312 := &gvar_4;
	v_315 := WIZARDFORM();
	v_314 := v_315.SELECTDIRPAGE;
	v_313 := v_314;
	v_316 := v_312;
	v_316.PARENT := v_313;
	v_318 := 5;
	v_317 := SCALEX(v_318);
	v_319 := v_312;
	v_319.LEFT := v_317;
	v_321 := 161;
	v_320 := SCALEY(v_321);
	v_322 := v_312;
	v_322.TOP := v_320;
	v_324 := 310;
	v_323 := SCALEX(v_324);
	v_325 := v_312;
	v_325.WIDTH := v_323;
	v_327 := 17;
	v_326 := SCALEY(v_327);
	v_328 := v_312;
	v_328.HEIGHT := v_326;
	v_330 := '{cm:SetupCaption4}';
	v_329 := EXPANDCONSTANT(v_330);
	v_331 := v_312;
	v_331.CAPTION := v_329;
	v_333 := '/TOR';
	v_332 := CHECKPARAM(v_333);
	v_334 := v_312;
	v_334.CHECKED := v_332;
	v_335 := procedure SETUPCLICK4(Arg0: TOBJECT);;
	v_336 := v_312;
	v_336.ONCLICK := v_335;
	v_338 := GETWINDOWSVERSION();
	v_337 := v_338 > 100794368;
	v_339 := v_312;
	v_339.ENABLED := v_337;
	v_341 := WIZARDFORM();
	v_340 := v_341;
	v_342 := 35;
	gvar_5 := v_342.CREATE(v_340);
	v_343 := &gvar_5;
	v_346 := WIZARDFORM();
	v_345 := v_346.SELECTDIRPAGE;
	v_344 := v_345;
	v_347 := v_343;
	v_347.PARENT := v_344;
	v_349 := 5;
	v_348 := SCALEX(v_349);
	v_350 := v_343;
	v_350.LEFT := v_348;
	v_352 := 183;
	v_351 := SCALEY(v_352);
	v_353 := v_343;
	v_353.TOP := v_351;
	v_355 := 310;
	v_354 := SCALEX(v_355);
	v_356 := v_343;
	v_356.WIDTH := v_354;
	v_358 := 17;
	v_357 := SCALEY(v_358);
	v_359 := v_343;
	v_359.HEIGHT := v_357;
	v_361 := '{cm:SetupCaption5}';
	v_360 := EXPANDCONSTANT(v_361);
	v_362 := v_343;
	v_362.CAPTION := v_360;
	v_364 := '/ACE';
	v_363 := CHECKPARAM(v_364);
	v_365 := v_343;
	v_365.CHECKED := v_363;
	v_366 := procedure SETUPCLICK5(Arg0: TOBJECT);;
	v_367 := v_343;
	v_367.ONCLICK := v_366;
	v_369 := GETWINDOWSVERSION();
	v_368 := v_369 > 100728832;
	v_370 := v_343;
	v_370.ENABLED := v_368;
	v_372 := WIZARDFORM();
	v_371 := v_372;
	v_373 := 35;
	gvar_6 := v_373.CREATE(v_371);
	v_374 := &gvar_6;
	v_377 := WIZARDFORM();
	v_376 := v_377.SELECTDIRPAGE;
	v_375 := v_376;
	v_378 := v_374;
	v_378.PARENT := v_375;
	v_380 := 5;
	v_379 := SCALEX(v_380);
	v_381 := v_374;
	v_381.LEFT := v_379;
	v_383 := 205;
	v_382 := SCALEY(v_383);
	v_384 := v_374;
	v_384.TOP := v_382;
	v_386 := 200;
	v_385 := SCALEX(v_386);
	v_387 := v_374;
	v_387.WIDTH := v_385;
	v_389 := 17;
	v_388 := SCALEY(v_389);
	v_390 := v_374;
	v_390.HEIGHT := v_388;
	v_392 := '{cm:SetupCaption6}';
	v_391 := EXPANDCONSTANT(v_392);
	v_393 := v_374;
	v_393.CAPTION := v_391;
	v_395 := '/S';
	v_394 := CHECKPARAM(v_395);
	v_396 := v_374;
	v_396.CHECKED := v_394;
	v_398 := WIZARDFORM();
	v_397 := v_398;
	v_399 := 34;
	gvar_0 := v_399.CREATE(v_397);
	v_400 := &gvar_0;
	v_403 := WIZARDFORM();
	v_402 := v_403.SELECTDIRPAGE;
	v_401 := v_402;
	v_404 := v_400;
	v_404.PARENT := v_401;
	v_406 := 5;
	v_405 := SCALEX(v_406);
	v_407 := v_400;
	v_407.LEFT := v_405;
	v_409 := 24;
	v_408 := SCALEY(v_409);
	v_410 := v_400;
	v_410.TOP := v_408;
	v_412 := 200;
	v_411 := SCALEX(v_412);
	v_413 := v_400;
	v_413.WIDTH := v_411;
	v_415 := 17;
	v_414 := SCALEY(v_415);
	v_416 := v_400;
	v_416.HEIGHT := v_414;
	v_418 := '{cm:SetupCaption1}';
	v_417 := EXPANDCONSTANT(v_418);
	v_419 := v_400;
	v_419.CAPTION := v_417;
	v_420 := procedure SETUPCLICK2(Arg0: TOBJECT);;
	v_421 := v_400;
	v_421.ONCLICK := v_420;
	v_422 := 1;
	v_423 := v_400;
	v_423.CHECKED := v_422;
	v_424 := 0;
	v_425 := v_400;
	v_425.TABORDER := v_424;
	v_427 := WIZARDFORM();
	v_426 := v_427;
	v_428 := 34;
	gvar_1 := v_428.CREATE(v_426);
	v_429 := &gvar_1;
	v_432 := WIZARDFORM();
	v_431 := v_432.SELECTDIRPAGE;
	v_430 := v_431;
	v_433 := v_429;
	v_433.PARENT := v_430;
	v_435 := 5;
	v_434 := SCALEX(v_435);
	v_436 := v_429;
	v_436.LEFT := v_434;
	v_438 := 46;
	v_437 := SCALEY(v_438);
	v_439 := v_429;
	v_439.TOP := v_437;
	v_441 := 200;
	v_440 := SCALEX(v_441);
	v_442 := v_429;
	v_442.WIDTH := v_440;
	v_444 := 17;
	v_443 := SCALEY(v_444);
	v_445 := v_429;
	v_445.HEIGHT := v_443;
	v_447 := '{cm:SetupCaption2}';
	v_446 := EXPANDCONSTANT(v_447);
	v_448 := v_429;
	v_448.CAPTION := v_446;
	v_449 := procedure SETUPCLICK2(Arg0: TOBJECT);;
	v_450 := v_429;
	v_450.ONCLICK := v_449;
	v_452 := '/P';
	v_451 := CHECKPARAM(v_452);
	v_453 := v_429;
	v_453.CHECKED := v_451;
	exit;
end;

function SHOULDSKIPPAGE(Arg0: Integer): BOOLEAN;
var
	v_1, v_2: BOOLEAN;
	v_3: TNEWRADIOBUTTON;
begin
	label_39321:
	result := Arg0 > 6;
	if not result then goto label_39391;
	label_39352:
	v_1 := Arg0 < 12;
	result := result and v_1;
	label_39391:
	if not result then goto label_39448;
	label_39401:
	v_3 := gvar_1;
	v_2 := v_3.CHECKED;
	result := result and v_2;
	label_39448:
	exit;
end;

procedure CURSTEPCHANGED(Arg0: TSETUPSTEP);
var
	v_1, v_5, v_6, v_13: Integer;
	v_2, v_3, v_4, v_10: BOOLEAN;
	v_7: TMSGBOXTYPE;
	v_8, v_9, v_14, v_15, v_16, v_17: UnicodeString;
	v_11: Pointer;
	v_12: TEXECWAIT;
begin
	label_39449:
	v_2 := Arg0 = 3;
	flag := not v_2;
	if flag then goto label_39898;
	label_39490:
	v_3 := WIZARDSILENT();
	v_3 := not v_3;
	if not v_3 then goto label_39684;
	label_39523:
	v_6 := 1;
	v_7 := 0;
	v_9 := '{cm:endsetup}';
	v_8 := EXPANDCONSTANT(v_9);
	v_5 := MSGBOX(v_8, v_7, v_6);
	v_4 := v_5 = 1;
	v_3 := v_3 and v_4;
	label_39684:
	flag := not v_3;
	if flag then goto label_39898;
	label_39697:
	v_11 := &v_1;
	v_12 := 0;
	v_13 := 5;
	v_14 := '';
	v_15 := '';
	v_17 := '{app}\PotPlayerMini.exe';
	v_16 := EXPANDCONSTANT(v_17);
	v_10 := EXEC(v_16, v_15, v_14, v_13, v_12, {var}v_11);
	label_39898:
	exit;
end;
