import 'package:get/state_manager.dart';

class WasteCountController extends GetxController {
  //kondisi
  RxBool isPaper = false.obs;
  RxBool isMixPaper = false.obs;
  //initial
  RxDouble initialPaper = 0.0.obs;
  RxDouble initialMixPaper = 0.0.obs;
  RxDouble initialPlastic = 0.0.obs;
  RxDouble initialGlass = 0.0.obs;
  RxDouble initialSachet = 0.0.obs;
  RxDouble initialMetal = 0.0.obs;
  RxDouble initialOil = 0.0.obs;
  //total
  RxDouble totalWeight = 0.0.obs;

  initialPaperPlus() {
    initialPaper + 0.5;
    update();
  }

  initialPaperMinus() {
    if (initialPaper > 0.0) {
      initialPaper - 0.5;
    }
    update();
  }

  initialMixPaperPlus() {
    initialMixPaper + 0.5;
    update();
  }

  initialMixPaperMinus() {
    if (initialMixPaper > 0.0) {
      initialMixPaper - 0.5;
    }
    update();
  }
}
