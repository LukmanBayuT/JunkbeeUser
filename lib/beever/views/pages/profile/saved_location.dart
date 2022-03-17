import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:junkbee_user/beever/const/const.dart';
import 'package:junkbee_user/beever/views/pages/profile/location.dart';

class SavedLocation extends StatefulWidget {
  const SavedLocation({Key? key}) : super(key: key);

  @override
  SavedLocationState createState() => SavedLocationState();
}

class SavedLocationState extends State<SavedLocation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(480, 850),
      builder: () => Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF8C503),
          title: Text('Saved Location', style: textBodyProfile,),
          centerTitle: true,
          leading: TouchableOpacity(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_new_rounded, size: 25)
          ),
        ),
        body: Container(
          width: ScreenUtil().setWidth(480),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 35, bottom: 15),
                width: ScreenUtil().setWidth(430),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))
                ),
                child: TouchableOpacity(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Location(),)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset('assets/group_1663.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setHeight(30),),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Add Location', style: textSemiBold,),
                            )
                          ],
                        ),
                      ),
                      Image.asset('assets/union_68.png', width: ScreenUtil().setWidth(15), height: ScreenUtil().setHeight(15),)
                    ],
                  )
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                width: ScreenUtil().setWidth(430),
                child: Text('Recent', style: textProfileBold,),
              ),
              Container(
                width: ScreenUtil().setWidth(430),
                height: ScreenUtil().setHeight(585),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          width: ScreenUtil().setWidth(430),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset('assets/group_1664.png', width: ScreenUtil().setWidth(30), height: ScreenUtil().setHeight(30),),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('Gudang Y, PT Amogus', style: textProfileBoldMini,),
                                          Text('Jl. Mangun harjo 66, gedhangan', style: textProfile,)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              TouchableOpacity(
                                onTap: () => print('delete'),
                                child: Image.asset('assets/trash_svgrepo_com.png', width: ScreenUtil().setWidth(18))
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          width: ScreenUtil().setWidth(430),
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)))),
                        )
                      ],
                    );
                  }
                )
              )
            ],
          ),
        )
      )
    );
  }
}