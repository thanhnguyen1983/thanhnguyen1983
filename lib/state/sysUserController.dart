import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/apiservice.dart';
import '../components/SYS_USER.dart';
import '../components/getds.dart';
import '../utilities/utility.dart';
class SysUserController extends GetxController
{
  var isLoading =true.obs;
  final RxList<SYSUSER> _items =<SYSUSER>[].obs;
  @override
  void onInit()
  {
   // fetchProducts();
    super.onInit();
  }
  void fetchProducts(String GROUP_ID)async
  {
    try{
      isLoading(true);
      _items.clear();
      var list=await ApiService.getSYSUSER(GROUP_ID);
      _items.assignAll(list);
      // print('fetchProducts ${_items.toJson()}');
    }finally{
      isLoading(false);
    }
  }
  List<SYSUSER> get items {
    return [..._items];
  }
  SYSUSER findItem(String  USER_ID)
  {
    int index=_items.indexWhere((element) => element. USER_ID== USER_ID);
    if(index==-1) {
      return SYSUSER(GROUP_ID: '',USER_ID: '', USER_NAME: '',GPS_FG:false,USE_FG:false);
    }
    return _items[index];
  }

  Future<void> UpdateItem(SYSUSER item)
  async {
    try
    {
      isLoading(true);
      int index=_items.indexWhere((element) => element.USER_ID==item.USER_ID);

      if(item.USER_ID=='') {

        int SEQ_NO=int.parse(_items.last.USER_ID.toString())+1;
        item.USER_ID=Utility.numbertoStringFormat(SEQ_NO,"000");


      }
      if (index >= 0) {
        _items[index].USER_NAME = item.USER_NAME;
        _items[index].GPS_FG = item.GPS_FG;
        _items[index].USE_FG = item.USE_FG;
        _items[index].GROUP_ID = item.GROUP_ID;

        try {
          isLoading(true);

          String s = " UPDATE SYS_USER SET USE_FG=N'${item.USE_FG}',GPS_FG=N'${item.GPS_FG}' WHERE USER_ID=N'${item.USER_ID}'";

          GetDS getDS = GetDS(
              sselect: "",
              suser: "",
              sty: "ExecuteSql",
              listselect: [s]

          );
          int res = await ApiService.ExecuteSql(getDS);

        }
        finally
        {

          isLoading(false);
        }


      }
      else {
        _items.add(item);
      }


      _items.refresh();

    }
    finally
    {
      isLoading(false);
    }

  }

  Future<int> createUser(SYSUSER sysuser)
  async {
    int code=0;
    try {

     // isLoading(true);

       code = await ApiService.postCreateUser(
          sysuser);

    }finally{

     // isLoading(false);

    }
    return code;
  }

  Future<void> deleteItem(String USER_ID)
  async {

    try {
      isLoading(true);

      String s = " DELETE SYS_USER WHERE USER_ID=N'${USER_ID}'";

      GetDS getDS = GetDS(
          sselect: "",
          suser: "",
          sty: "ExecuteSql",
          listselect: [s]

      );
      int res = await ApiService.ExecuteSql(getDS);
      if(res==200) {
        _items.removeWhere((element) => element.USER_ID == USER_ID);
      }
    }
    finally
    {

      isLoading(false);
    }
  }



}