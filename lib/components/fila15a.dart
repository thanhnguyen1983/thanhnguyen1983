class FILA15A {
  String? LEA_ID;
  String? SEQ_NO;
  String? COL_NM;
  String? LEA_NM;
  String? LEA_EN;
  String? LEA_VN;
  String? SHR_NM;
  int? DAY_MM;
  int? DAY_YY;
  int? DAY_QT;
  int? DAY_TM;
  bool? SAL_CK;
  bool? HOL_BT;
  String? LEA_CH;
  bool? CHK_ID;
  String? COR_NM;
  bool? PRT_FG;
  bool? SAL_BT;
  String? STY_NO;
  bool? MOB_FG;
  FILA15A(
      {this.MOB_FG,this.LEA_ID, this.SEQ_NO, this.COL_NM, this.LEA_NM, this.LEA_EN, this.LEA_VN, this.SHR_NM, this.DAY_MM, this.DAY_YY, this.DAY_QT, this.DAY_TM, this.SAL_CK, this.HOL_BT, this.LEA_CH, this.CHK_ID, this.COR_NM, this.PRT_FG, this.SAL_BT, this.STY_NO});

  factory FILA15A.fromJson(Map<String, dynamic> json)=>
      FILA15A(
          LEA_ID: json['LEA_ID'] ?? '',
          SEQ_NO: json['SEQ_NO'] ?? '',
          COL_NM: json['COL_NM'] ?? '',
          LEA_NM: json['LEA_NM'] ?? '',
          LEA_EN: json['LEA_EN'] ?? '',
          LEA_VN: json['LEA_VN'] ?? '',
          SHR_NM: json['SHR_NM'] ?? '',
          DAY_MM: json['DAY_MM'] as int,
          DAY_YY: json['DAY_YY'] as int,
          DAY_QT: json['DAY_QT'] as int,
          DAY_TM: json['DAY_TM'] as int,
          SAL_CK: json['SAL_CK'] as bool,
          HOL_BT: json['HOL_BT'] as bool,
          LEA_CH: json['LEA_CH'] ?? '',
          CHK_ID: json['CHK_ID'] as bool,
          COR_NM: json['COR_NM'] ?? '',
          PRT_FG: json['PRT_FG'] as bool,
          SAL_BT: json['SAL_BT'] as bool,
          STY_NO: json['STY_NO'] ?? '',
           MOB_FG: json['MOB_FG'] as bool
      );

  Map<String, dynamic> toJson() =>
      {
        'LEA_ID': LEA_ID ?? '',
        'SEQ_NO': SEQ_NO ?? '',
        'COL_NM': COL_NM ?? '',
        'LEA_NM': LEA_NM ?? '',
        'LEA_EN': LEA_EN ?? '',
        'LEA_VN': LEA_VN ?? '',
        'SHR_NM': SHR_NM ?? '',
        'DAY_MM': DAY_MM ?? 0,
        'DAY_YY': DAY_YY ?? 0,
        'DAY_QT': DAY_QT ?? 0,
        'DAY_TM': DAY_TM ?? 0,
        'SAL_CK': SAL_CK! ? 1 : 0,
        'HOL_BT': HOL_BT! ? 1 : 0,
        'LEA_CH': LEA_CH ?? '',
        'CHK_ID': CHK_ID! ? 1 : 0,
        'COR_NM': COR_NM ?? '',
        'PRT_FG': PRT_FG! ? 1 : 0,
        'SAL_BT': SAL_BT! ? 1 : 0,
        'STY_NO': STY_NO ?? '',
        'MOB_FG': MOB_FG! ? 1 : 0
      };
}