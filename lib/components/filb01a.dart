class FILB01A {
  String? EMP_ID;
  String? CRD_NO;
  String? DEP_ID;
  String? EMP_NM;
  String? POS_ID;
  String? TYP_ID;
  String? INH_DT;
  String? BIR_DT;
  bool? SEX_BT;
  bool? MAR_BT;
  String? ADD_DR;
  String? CRD_ID;
  String? CRD_DT;
  String? CRD_LC;
  String? RAC_NM;
  String? REL_DR;
  String? EMP_I1;
  String? EMP_N1;
  String? MST_DR;
  String? ADD_D1;
  String? EDU_DR;
  String? PRO_ID;
  String? GRA_ID;
  String? TEL_NO;
  String? ACC_NO;
  String? ACC_NM;
  String? BNK_NM;
  bool? MEA_BT;
  bool? ATT_BT;
  bool? VAC_BT;
  String? LEV_ID;
  bool? BHX_BT;
  String? SEN_DT;
  String? REM_DR;
  bool? COD_BT;
  String? NAT_NM;
  String? COU_ID;
  String? CIT_NM;
  String? CIT_ID;
  String? NAT_CO;
  bool? NEW_BT;
  bool? DEL_BT;
  String? GRT_ID;
  String? GRP_ID;
  bool? LCK_BT;
  bool? DIR_BT;
  String? BLT_NM;
  String? BLT_DT;
  String? LST_NM;
  String? LST_DT;
  String? REM_D2;
  String? COU_NM;
  int? SEQ_N1;
  String? CRD_N1;
  bool? PAY_FG;
  bool? BYT_BT;
  bool? WRK_FG;
  bool? DRC_FG;
  String? NAT_ID;
  bool? ATT_DR;
  String? INH_D1;
  String? EMP_N2;
  String? BHX_NO;
  String? BYT_NO;
  String? CON_DR;
  String? SHI_ID;
  String? BHX_DT;
  bool? SEA_FG;
  String? BOK_NO;
  double? SEQ_N2;
  String? INH_D2;
  int? iPrivilege;
  String? sPassword;
  String? Password;
  bool? WIF_FG;
  bool? GPS_FG;
  bool? MOB_FG;
  String? DEP_VN;
  String? DEP_CH;
  String? TYP_VN;
  String? TYP_CH;
  String? POS_VN;
  String? POS_CH;
  String? extension;
  String? token;
  String? EML_DR;
  String? GROUP_ID;

  FILB01A(
      {this.EMP_ID, this.CRD_NO, this.DEP_ID, this.EMP_NM, this.POS_ID, this.TYP_ID, this.INH_DT, this.BIR_DT, this.SEX_BT, this.MAR_BT, this.ADD_DR, this.CRD_ID, this.CRD_DT, this.CRD_LC, this.RAC_NM, this.REL_DR, this.EMP_I1, this.EMP_N1, this.MST_DR, this.ADD_D1, this.EDU_DR, this.PRO_ID, this.GRA_ID, this.TEL_NO, this.ACC_NO, this.ACC_NM, this.BNK_NM, this.MEA_BT, this.ATT_BT, this.VAC_BT, this.LEV_ID, this.BHX_BT, this.SEN_DT, this.REM_DR, this.COD_BT, this.NAT_NM, this.COU_ID, this.CIT_NM, this.CIT_ID, this.NAT_CO, this.NEW_BT, this.DEL_BT, this.GRT_ID, this.GRP_ID, this.LCK_BT, this.DIR_BT, this.BLT_NM, this.BLT_DT, this.LST_NM, this.LST_DT, this.REM_D2, this.COU_NM, this.SEQ_N1, this.CRD_N1, this.PAY_FG, this.BYT_BT, this.WRK_FG, this.DRC_FG, this.NAT_ID, this.ATT_DR, this.INH_D1, this.EMP_N2, this.BHX_NO, this.BYT_NO, this.CON_DR, this.SHI_ID, this.BHX_DT, this.SEA_FG, this.BOK_NO, this.SEQ_N2, this.INH_D2, this.iPrivilege, this.sPassword, this.Password,this.WIF_FG,this.GPS_FG,this.MOB_FG,this.DEP_CH,this.DEP_VN,this.POS_CH,this.POS_VN,this.TYP_CH,this.TYP_VN,this.extension,this.token,this.EML_DR,this.GROUP_ID});

  factory FILB01A.fromJson(Map<String, dynamic> json)=>
      FILB01A(
          EMP_ID: json['EMP_ID'] ?? '',
          CRD_NO: json['CRD_NO'] ?? '',
          DEP_ID: json['DEP_ID'] ?? '',
          EMP_NM: json['EMP_NM'] ?? '',
          POS_ID: json['POS_ID'] ?? '',
          TYP_ID: json['TYP_ID'] ?? '',
          INH_DT: json['INH_DT'] ?? '',
          BIR_DT: json['BIR_DT'] ?? '',
          SEX_BT: json['SEX_BT'] as bool,
          MAR_BT: json['MAR_BT'] as bool,
          ADD_DR: json['ADD_DR'] ?? '',
          CRD_ID: json['CRD_ID'] ?? '',
          CRD_DT: json['CRD_DT'] ?? '',
          CRD_LC: json['CRD_LC'] ?? '',
          RAC_NM: json['RAC_NM'] ?? '',
          REL_DR: json['REL_DR'] ?? '',
          EMP_I1: json['EMP_I1'] ?? '',
          EMP_N1: json['EMP_N1'] ?? '',
          MST_DR: json['MST_DR'] ?? '',
          ADD_D1: json['ADD_D1'] ?? '',
          EDU_DR: json['EDU_DR'] ?? '',
          PRO_ID: json['PRO_ID'] ?? '',
          GRA_ID: json['GRA_ID'] ?? '',
          TEL_NO: json['TEL_NO'] ?? '',
          ACC_NO: json['ACC_NO'] ?? '',
          ACC_NM: json['ACC_NM'] ?? '',
          BNK_NM: json['BNK_NM'] ?? '',
          MEA_BT: json['MEA_BT'] as bool,
          ATT_BT: json['ATT_BT'] as bool,
          VAC_BT: json['VAC_BT'] as bool,
          LEV_ID: json['LEV_ID'] ?? '',
          BHX_BT: json['BHX_BT'] as bool,
          SEN_DT: json['SEN_DT'] ?? '',
          REM_DR: json['REM_DR'] ?? '',
          COD_BT: json['COD_BT'] as bool,
          NAT_NM: json['NAT_NM'] ?? '',
          COU_ID: json['COU_ID'] ?? '',
          CIT_NM: json['CIT_NM'] ?? '',
          CIT_ID: json['CIT_ID'] ?? '',
          NAT_CO: json['NAT_CO'] ?? '',
          NEW_BT: json['NEW_BT'] as bool,
          DEL_BT: json['DEL_BT'] as bool,
          GRT_ID: json['GRT_ID'] ?? '',
          GRP_ID: json['GRP_ID'] ?? '',
          LCK_BT: json['LCK_BT'] as bool,
          DIR_BT: json['DIR_BT'] as bool,
          BLT_NM: json['BLT_NM'] ?? '',
          BLT_DT: json['BLT_DT'] ?? '',
          LST_NM: json['LST_NM'] ?? '',
          LST_DT: json['LST_DT'] ?? '',
          REM_D2: json['REM_D2'] ?? '',
          COU_NM: json['COU_NM'] ?? '',
          SEQ_N1: json['SEQ_N1'] as int,
          CRD_N1: json['CRD_N1'] ?? '',
          PAY_FG: json['PAY_FG'] as bool,
          BYT_BT: json['BYT_BT'] as bool,
          WRK_FG: json['WRK_FG'] as bool,
          DRC_FG: json['DRC_FG'] as bool,
          NAT_ID: json['NAT_ID'] ?? '',
          ATT_DR: json['ATT_DR'] as bool,
          INH_D1: json['INH_D1'] ?? '',
          EMP_N2: json['EMP_N2'] ?? '',
          BHX_NO: json['BHX_NO'] ?? '',
          BYT_NO: json['BYT_NO'] ?? '',
          CON_DR: json['CON_DR'] ?? '',
          SHI_ID: json['SHI_ID'] ?? '',
          BHX_DT: json['BHX_DT'] ?? '',
          SEA_FG: json['SEA_FG'] as bool,
          BOK_NO: json['BOK_NO'] ?? '',
          SEQ_N2: json['SEQ_N2'] as double,
          INH_D2: json['INH_D2'] ?? '',
          iPrivilege: json['iPrivilege'] as int,
          sPassword: json['sPassword'] ?? '',
          Password: json['Password'] ?? '',
          WIF_FG: json['WIF_FG'] as bool,
          GPS_FG: json['GPS_FG'] as bool,
          MOB_FG: json['MOB_FG'] as bool,
        DEP_VN: json['DEP_VN'] ?? '',
        DEP_CH: json['DEP_CH'] ?? '',
        POS_VN: json['POS_VN'] ?? '',
        POS_CH: json['POS_CH'] ?? '',
        TYP_VN: json['TYP_VN'] ?? '',
          TYP_CH: json['TYP_CH'] ?? '',
          extension: json['extension'] ?? '',
        token:json['token']??'',
        EML_DR: json['EML_DR'] ?? '',
          GROUP_ID: json['GROUP_ID'] ?? ''

      );

  Map<String, dynamic> toJson() =>
      {
        'EMP_ID': EMP_ID ?? '',
        'CRD_NO': CRD_NO ?? '',
        'DEP_ID': DEP_ID ?? '',
        'EMP_NM': EMP_NM ?? '',
        'POS_ID': POS_ID ?? '',
        'TYP_ID': TYP_ID ?? '',
        'INH_DT': INH_DT ?? '',
        'BIR_DT': BIR_DT ?? '',
        'SEX_BT': SEX_BT! ? true : false,
        'MAR_BT': MAR_BT! ? true : false,
        'ADD_DR': ADD_DR ?? '',
        'CRD_ID': CRD_ID ?? '',
        'CRD_DT': CRD_DT ?? '',
        'CRD_LC': CRD_LC ?? '',
        'RAC_NM': RAC_NM ?? '',
        'REL_DR': REL_DR ?? '',
        'EMP_I1': EMP_I1 ?? '',
        'EMP_N1': EMP_N1 ?? '',
        'MST_DR': MST_DR ?? '',
        'ADD_D1': ADD_D1 ?? '',
        'EDU_DR': EDU_DR ?? '',
        'PRO_ID': PRO_ID ?? '',
        'GRA_ID': GRA_ID ?? '',
        'TEL_NO': TEL_NO ?? '',
        'ACC_NO': ACC_NO ?? '',
        'ACC_NM': ACC_NM ?? '',
        'BNK_NM': BNK_NM ?? '',
        'MEA_BT': MEA_BT! ? true : false,
        'ATT_BT': ATT_BT! ? true : false,
        'VAC_BT': VAC_BT! ? true : false,
        'LEV_ID': LEV_ID ?? '',
        'BHX_BT': BHX_BT! ? true : false,
        'SEN_DT': SEN_DT ?? '',
        'REM_DR': REM_DR ?? '',
        'COD_BT': COD_BT! ? true : false,
        'NAT_NM': NAT_NM ?? '',
        'COU_ID': COU_ID ?? '',
        'CIT_NM': CIT_NM ?? '',
        'CIT_ID': CIT_ID ?? '',
        'NAT_CO': NAT_CO ?? '',
        'NEW_BT': NEW_BT! ? true : false,
        'DEL_BT': DEL_BT! ? true : false,
        'GRT_ID': GRT_ID ?? '',
        'GRP_ID': GRP_ID ?? '',
        'LCK_BT': LCK_BT! ? true : false,
        'DIR_BT': DIR_BT! ? true : false,
        'BLT_NM': BLT_NM ?? '',
        'BLT_DT': BLT_DT ?? '',
        'LST_NM': LST_NM ?? '',
        'LST_DT': LST_DT ?? '',
        'REM_D2': REM_D2 ?? '',
        'COU_NM': COU_NM ?? '',
        'SEQ_N1': SEQ_N1 ?? 0,
        'CRD_N1': CRD_N1 ?? '',
        'PAY_FG': PAY_FG! ? true : false,
        'BYT_BT': BYT_BT! ? true : false,
        'WRK_FG': WRK_FG! ? true : false,
        'DRC_FG': DRC_FG! ? true : false,
        'NAT_ID': NAT_ID ?? '',
        'ATT_DR': ATT_DR! ? true : false,
        'INH_D1': INH_D1 ?? '',
        'EMP_N2': EMP_N2 ?? '',
        'BHX_NO': BHX_NO ?? '',
        'BYT_NO': BYT_NO ?? '',
        'CON_DR': CON_DR ?? '',
        'SHI_ID': SHI_ID ?? '',
        'BHX_DT': BHX_DT ?? '',
        'SEA_FG': SEA_FG! ? true : false,
        'BOK_NO': BOK_NO ?? '',
        'SEQ_N2': SEQ_N2 ?? 0,
        'INH_D2': INH_D2 ?? '',
        'iPrivilege': iPrivilege ?? 0,
        'sPassword': sPassword ?? '',
        'Password': Password ?? '',
        'WIF_FG': WIF_FG! ? true : false,
        'GPS_FG': GPS_FG! ? true : false,
        'MOB_FG': MOB_FG! ? true : false,
        'DEP_VN': DEP_VN ?? '',
        'DEP_CH': DEP_CH ?? '',
        'TYP_VN': TYP_VN ?? '',
        'TYP_CH': TYP_CH ?? '',
        'POS_VN': POS_VN ?? '',
        'POS_CH': POS_CH ?? '',
        'extension':extension??'',
        'token':token??'',
        'EML_DR':EML_DR??'',
        'GROUP_ID':GROUP_ID??''
      };
}
