import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:junkbee_user/user/controller/waste_count.dart';
import 'package:junkbee_user/user/service/api_service/api_calls_get_data.dart';

class CobaGetX extends StatefulWidget {
  const CobaGetX({Key? key}) : super(key: key);

  @override
  State<CobaGetX> createState() => _CobaGetXState();
}

class _CobaGetXState extends State<CobaGetX> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiCallsGetDataUser().getWastePrice();
  }

  WasteCountController wasteCountController = Get.put(WasteCountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                GetBuilder<WasteCountController>(
                    builder: (controller) =>
                        Text('${controller.initialPaper}')),
                ElevatedButton(
                    onPressed: () {
                      Get.find<WasteCountController>().initialPaperPlus();
                    },
                    child: const Text('Tambah')),
                ElevatedButton(
                    onPressed: () {
                      Get.find<WasteCountController>().initialPaperMinus();
                    },
                    child: const Text('Kurang')),
                GetBuilder<WasteCountController>(
                    builder: (controller) =>
                        Text('${controller.initialMixPaper}')),
                ElevatedButton(
                    onPressed: () {
                      Get.find<WasteCountController>().initialMixPaperPlus();
                    },
                    child: const Text('Tambah')),
                ElevatedButton(
                    onPressed: () {
                      Get.find<WasteCountController>().initialMixPaperMinus();
                    },
                    child: const Text('Kurang'))
              ],
            ),
          );
        },
      ),
    );
  }
}
