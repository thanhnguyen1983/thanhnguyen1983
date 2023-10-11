

class LanguageService
{
  static String defaultLanguage = 'vn';
  static final Map<String, Map<String, String>> _localizedValues = {
    'ch': {
      'LOG_IN':'登錄',
      'EMP_ID': '員工卡號',
      'PAS_NO': '密碼',
      'FOR_DR': '忘記密碼了嗎？',
      'REM_PS':'記住你的密碼',
      'ENT_NM':'輸入你的用戶名',
      'ENT_PS':'輸入您的密碼',
      'MNU_01':'出勤管理',
      'MNU_02':'休假',
      'MNU_03':'排班項目',
      'MNU_04':'每天出勤明細',
      'MNU_05':'每月出勤總結',
      'MNU_06':'薪资单',
      'MNU_07':'Mục Lương',
      'HOME':'通知',
      'NOTIFICATION':'通知',
      'LOG_OT':'登出',
      'FIN_DR':'搜尋',
      'STR_DT':'日',
      'END_DT':'到日',
      'OK':'同意',
      'DAY_BT':'按日輸入假',
      'HOU_BT':'時間',
      'RES_DR':'請輸入原因!',
      'INP_DT':'選日期!',
      'INT_HR':'您未輸入資料日',
      'SEL_DT':'選擇小時',
      'MON_DR':'月',
      'Noshift':'No shift',
      'Dayoff':'Day off',
      'ONN_TM':'上班',
      'OFF_TM':'下班',
      'TYP_ID':'時段定義',
      'WRK_HR':'正常工時',
      'MAN_OU':'產假',
      'LAT_BT':'遲/早',
      'ListShift':'班別類型',
      'ATT_DY':'工作日',
      'NIG_DY':'工作日(夜)',
      'EAR_MN':'早退分鐘',
      'LAT_MN':'遲到分鐘',
      'LEA_I1':'請假類別',
      'ABS_MN':'曠職時數',
      'FOR_TM':'忘記刷卡',
      'Hour':'小時',
      'To':'直到',
      'Day':'天',
      'VacationInYear':'年度休假',
      'Msgvacation':'已休 [total] 天 [LEA_ID] 年度.',
      'DIS_QT':'已請假天數',
      'CAN_QT':'可請假天數',
      'info':'i信息',
      'needcontract':'需簽合同',
      'newinmonth':'本月新進',
      'offinmonth':'本月離職',
      'totalstaff':'全部的',
      'MonthlyReports':'月報',
      'Current':'當前',
      'ListStaff':'列表',
      'avata':'化身',
      'donthaveaccount':'沒有賬戶？',
      'signup':'報名',
      'email':'電郵',
      'passcomfirm':'確認密碼',
      'passcurrent':'當前通行證',
      'newpass':'新通行證',
      'changepass':'更改密码',
      'emailvalidate':'验证电子邮件',
      'forgotpass':'忘記密碼?',
      'errorlogin':'登錄時出錯',
      'changepass1':'更換密碼',
      'APV_N1':'未核准',
      'APV_N2':'已批准',
      'AppvovalVacation':'是否同意批准',
      'modify':'沒有權限',
      'cannotaccess':'您無權訪問'

    },
    'vn': {
      'LOG_IN':'Đăng Nhập',
      'EMP_ID': 'Mã số nhân viên',
      'PAS_NO': 'mật khẩu',
      'FOR_DR': 'Quên mật khẩu？',
      'REM_PS':'Nhớ mật khẩu',
      'ENT_NM':'Nhập tên đăng nhập',
      'ENT_PS':'Nhập mật khẩu',
      'MNU_01':'Chấm Công',
      'MNU_02':'Nghỉ Phép',
      'MNU_03':'Sắp ca',
      'MNU_04':'Chi Tiết Chấm Công',
      'MNU_05':'Tổng Kết Tháng',
      'MNU_06':'Phiếu Lương',
      'MNU_07':'Mục Lương',
      'HOME':'Trang Chủ',
      'NOTIFICATION':'Thông Báo',
      'LOG_OT':'Đăng Xuất',
      'FIN_DR':'Tìm Kiếm',
      'STR_DT':'Từ ngày',
      'END_DT':'Đến ngày',
      'OK':'Đồng Ý',
      'DAY_BT':'Nghỉ nguyên ngày',
      'HOU_BT':'Nghỉ theo giờ',
      'RES_DR':'Bạn chưa nhập loại phép!',
      'INP_DT':'bạn chưa nhập ngày!',
      'INT_HR':'Bạn chưa nhập giờ!',
      'SEL_DT':'Chọn giờ',
      'MON_DR':'Tháng',
      'Noshift':'chưa sắp ca',
      'Dayoff':'Nghỉ',
      'ONN_TM':'Vào',
      'OFF_TM':'Ra',
      'TYP_ID':'Thời gian',
      'WRK_HR':'Giơ làn',
      'MAN_OU':'Thai sản',
      'LAT_BT':'Trễ/Sóm',
      'ListShift':'Danh mục ca',
      'ATT_DY':'Số ngày làm',
      'NIG_DY':'Số ngày làm(đêm)',
      'EAR_MN':'Số phút sớm',
      'LAT_MN':'Số phút trễ',
      'LEA_I1':'Loại phép',
      'ABS_MN':'số phút vắng',
      'FOR_TM':'quên thẻ',
      'Hour':'Giờ',
      'To':'Đến',
      'Day':'Ngày',
      'VacationInYear':'Nghỉ trong năm',
      'Msgvacation':'đã nghỉ [total] ngày [LEA_ID] trong năm.',
      'DIS_QT':'Đã nghỉ',
      'CAN_QT':'còn lại',
      'info':'Thông tin',
      'needcontract':'ký HĐ',
      'newinmonth':'NV Mới',
      'offinmonth':'NV Nghỉ',
      'totalstaff':'Tổng',
      'MonthlyReports':'Báo cáo tháng',
      'Current':'Hiện tại',
      'ListStaff':'Danh sách',
      'avata':'Hình ảnh',
      'donthaveaccount':'Bạn chưa có tài khoản？',
      'signup':'Đăng Ký',
      'email':'email',
      'passcomfirm':'xác nhận mật khảu',
      'passcurrent':'mật khẩu hiện tại',
      'newpass':'mật khẩu mới',
      'changepass':'Thay Đổi',
      'emailvalidate':'email không hợp lệ',
      'forgotpass':'Quên mật khẩu?',
      'errorlogin':'Lỗi khi đăng nhập',
      'changepass1':'Đổi Mật Mã',
       'APV_N1':'P.chưa duyệt',
       'APV_N2':'P.đã duyệt',
      'AppvovalVacation':'Bạn có đồng ý duyệt phép!',
      'modify':'Bạn không thể nhập phép!',
      'cannotaccess':'Bạn không có quyền truy cập'
    }
  };
  static set language(String lang) {
    defaultLanguage = lang;
  }
  static String get LOG_IN {
    return _localizedValues[defaultLanguage]!['LOG_IN']!;
  }
  static String get EMP_ID {
    return _localizedValues[defaultLanguage]!['EMP_ID']!;
  }
  static String get language {
    return _localizedValues[defaultLanguage]!['language']!;
  }
  static String get PAS_NO {
    return _localizedValues[defaultLanguage]!['PAS_NO']!;
  }
  static String get FOR_DR {
    return _localizedValues[defaultLanguage]!['FOR_DR']!;
  }
  static String get REM_PS {
    return _localizedValues[defaultLanguage]!['REM_PS']!;
  }
  static String get ENT_NM {
    return _localizedValues[defaultLanguage]!['ENT_NM']!;
  }
  static String get ENT_PS {
    return _localizedValues[defaultLanguage]!['ENT_PS']!;
  }
  static String get MNU_01 {
    return _localizedValues[defaultLanguage]!['MNU_01']!;
  }
  static String get MNU_02 {
    return _localizedValues[defaultLanguage]!['MNU_02']!;
  }
  static String get MNU_03 {
    return _localizedValues[defaultLanguage]!['MNU_03']!;
  }
  static String get MNU_04 {
    return _localizedValues[defaultLanguage]!['MNU_04']!;
  }
  static String get MNU_05 {
    return _localizedValues[defaultLanguage]!['MNU_05']!;
  }
  static String get MNU_06 {
    return _localizedValues[defaultLanguage]!['MNU_06']!;
  }
  static String get MNU_07 {
    return _localizedValues[defaultLanguage]!['MNU_07']!;
  }

  static String get HOME {
    return _localizedValues[defaultLanguage]!['HOME']!;
  }
  static String get NOTIFICATION {
    return _localizedValues[defaultLanguage]!['NOTIFICATION']!;
  }
  static String get LOG_OT {
    return _localizedValues[defaultLanguage]!['LOG_OT']!;
  }

  static String get FIN_DR {
    return _localizedValues[defaultLanguage]!['FIN_DR']!;
  }

  static String get STR_DT {
    return _localizedValues[defaultLanguage]!['STR_DT']!;
  }
  static String get END_DT {
    return _localizedValues[defaultLanguage]!['END_DT']!;
  }
  static String get OK {
    return _localizedValues[defaultLanguage]!['OK']!;
  }
  static String get DAY_BT {
    return _localizedValues[defaultLanguage]!['DAY_BT']!;
  }
  static String get HOU_BT {
    return _localizedValues[defaultLanguage]!['HOU_BT']!;
  }
  static String get RES_DR {
    return _localizedValues[defaultLanguage]!['RES_DR']!;
  }
  static String get INP_DT {
    return _localizedValues[defaultLanguage]!['INP_DT']!;
  }
  static String get INT_HR {
    return _localizedValues[defaultLanguage]!['INT_HR']!;
  }
  static String get SEL_DT {
    return _localizedValues[defaultLanguage]!['SEL_DT']!;
  }
  static String get MON_DR {
    return _localizedValues[defaultLanguage]!['MON_DR']!;
  }
  static String get Noshift {
    return _localizedValues[defaultLanguage]!['Noshift']!;
  }
  static String get Dayoff {
    return _localizedValues[defaultLanguage]!['Dayoff']!;
  }

  static String get ONN_TM {
    return _localizedValues[defaultLanguage]!['ONN_TM']!;
  }
  static String get OFF_TM {
    return _localizedValues[defaultLanguage]!['OFF_TM']!;
  }
  static String get TYP_ID {
    return _localizedValues[defaultLanguage]!['TYP_ID']!;
  }
  static String get WRK_HR {
    return _localizedValues[defaultLanguage]!['WRK_HR']!;
  }
  static String get MAN_OU {
    return _localizedValues[defaultLanguage]!['MAN_OU']!;
  }
  static String get LAT_BT {
    return _localizedValues[defaultLanguage]!['LAT_BT']!;
  }
  static String get ListShift {
    return _localizedValues[defaultLanguage]!['ListShift']!;
  }
  static String get ATT_DY {
    return _localizedValues[defaultLanguage]!['ATT_DY']!;
  }
  static String get NIG_DY {
    return _localizedValues[defaultLanguage]!['NIG_DY']!;
  }

  static String get EAR_MN {
    return _localizedValues[defaultLanguage]!['EAR_MN']!;
  }
  static String get LAT_MN {
    return _localizedValues[defaultLanguage]!['LAT_MN']!;
  }
  static String get LEA_I1 {
    return _localizedValues[defaultLanguage]!['LEA_I1']!;
  }
  static String get ABS_MN {
    return _localizedValues[defaultLanguage]!['ABS_MN']!;
  }
  static String get FOR_TM {
    return _localizedValues[defaultLanguage]!['FOR_TM']!;
  }
  static String get Hour {
    return _localizedValues[defaultLanguage]!['Hour']!;
  }
  static String get To {
    return _localizedValues[defaultLanguage]!['To']!;
  }
  static String get Day {
    return _localizedValues[defaultLanguage]!['Day']!;
  }
  static String get VacationInYear {
    return _localizedValues[defaultLanguage]!['VacationInYear']!;
  }
  static String get Msgvacation {
    return _localizedValues[defaultLanguage]!['Msgvacation']!;
  }
  static String get DIS_QT {
    return _localizedValues[defaultLanguage]!['DIS_QT']!;
  }
  static String get CAN_QT {
    return _localizedValues[defaultLanguage]!['CAN_QT']!;
  }
  static String get info {
    return _localizedValues[defaultLanguage]!['info']!;
  }
  static String get needcontract {
    return _localizedValues[defaultLanguage]!['needcontract']!;
  }
  static String get newinmonth {
    return _localizedValues[defaultLanguage]!['newinmonth']!;
  }
  static String get offinmonth {
    return _localizedValues[defaultLanguage]!['offinmonth']!;
  }
  static String get totalstaff {
    return _localizedValues[defaultLanguage]!['totalstaff']!;
  }
  static String get MonthlyReports {
    return _localizedValues[defaultLanguage]!['MonthlyReports']!;
  }
  static String get Current {
    return _localizedValues[defaultLanguage]!['Current']!;
  }
  static String get ListStaff {
    return _localizedValues[defaultLanguage]!['ListStaff']!;
  }
  static String get avata {
    return _localizedValues[defaultLanguage]!['avata']!;
  }
  static String get donthaveaccount {
    return _localizedValues[defaultLanguage]!['donthaveaccount']!;
  }
  static String get signup {
    return _localizedValues[defaultLanguage]!['signup']!;
  }
  static String get email {
    return _localizedValues[defaultLanguage]!['email']!;
  }
  static String get passcomfirm {
    return _localizedValues[defaultLanguage]!['passcomfirm']!;
  }

  static String get passcurrent {
    return _localizedValues[defaultLanguage]!['passcurrent']!;
  }
  static String get newpass {
    return _localizedValues[defaultLanguage]!['newpass']!;
  }
  static String get changepass {
    return _localizedValues[defaultLanguage]!['changepass']!;
  }
  static String get emailvalidate {
    return _localizedValues[defaultLanguage]!['emailvalidate']!;
  }
  static String get forgotpass {
    return _localizedValues[defaultLanguage]!['forgotpass']!;
  }
  static String get errorlogin {
    return _localizedValues[defaultLanguage]!['errorlogin']!;
  }
  static String get changepass1 {
    return _localizedValues[defaultLanguage]!['changepass1']!;
  }
  static String get APV_N1 {
    return _localizedValues[defaultLanguage]!['APV_N1']!;
  }
  static String get APV_N2 {
    return _localizedValues[defaultLanguage]!['APV_N2']!;
  }
  static String get AppvovalVacation {
    return _localizedValues[defaultLanguage]!['AppvovalVacation']!;
  }
  static String get modify {
    return _localizedValues[defaultLanguage]!['modify']!;
  }
  static String get cannotaccess {
    return _localizedValues[defaultLanguage]!['cannotaccess']!;
  }
}


