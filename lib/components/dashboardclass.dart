class DashBoardClass
{
  int? totalStaff;
  int? newsStaff;
  int? offStaff;
  int? needContract;
  int? off01;
  int? off02;
  int? off03;
  int? off04;
  int? off05;
  int? off06;
  int? off07;
  int? off08;
  int? off09;
  int? off10;
  int? off11;
  int? off12;
  int? maxoff;
  DashBoardClass({this.totalStaff,this.newsStaff,this.offStaff,this.needContract,this.off01,this.off02,this.off03,this.off04,this.off05,this.off06,this.off07,this.off08,this.off09,this.off10,this.off11,this.off12,this.maxoff});

  factory DashBoardClass.fromJson(Map<String, dynamic> json)=>
      DashBoardClass(
        totalStaff: json['totalStaff'] as int,
        newsStaff: json['newsStaff'] as int,
        offStaff: json['offStaff'] as int,
        needContract: json['needContract'] as int,
        off01: json['off01'] as int,
        off02: json['off02'] as int,
        off03: json['off03'] as int,
        off04: json['off04'] as int,
        off05: json['off05'] as int,
        off06: json['off06'] as int,
        off07: json['off07'] as int,
        off08: json['off08'] as int,
        off09: json['off09'] as int,
        off10: json['off10'] as int,
        off11: json['off11'] as int,
        off12: json['off12'] as int,
        maxoff: json['maxoff'] as int
      );
  Map<String, dynamic> toJson() =>
      {

        'totalStaff': totalStaff ?? 0,
        'newsStaff': newsStaff ?? 0,
        'offStaff': offStaff ?? 0,
        'needContract': needContract ?? 0,
        'off01': off01 ?? 0,
        'off02': off02 ?? 0,
        'off03': off03 ?? 0,
        'off04': off04 ?? 0,
        'off05': off05 ?? 0,
        'off06': off06 ?? 0,
        'off07': off07 ?? 0,
        'off08': off08 ?? 0,
        'off09': off09 ?? 0,
        'off10': off10 ?? 0,
        'off11': off11 ?? 0,
        'off12': off12 ?? 0,
        'maxoff': maxoff ?? 0

      };
}