import 'package:get/get.dart';

class DataviewController extends GetxController {
  //final fillData, fillData1, widgetEnabled = false.obs;

  final radioValue = 1.obs; //Mainpage > SelectRadio Observable

  final selectedDate1 = DateTime.now().obs; //SelectDate Observable
  final selectedDate2 = DateTime.now().obs; //SelectDate Observable

  final selectedDate3 = DateTime.now().obs; //FitupEntry > SelectDate Observable
  final selectedDate4 = DateTime.now().obs; //WeldEntry > SelectDate Observable

  final dropSelectQ1 = 'Oğuz KABA'.obs; //IsoSpool Info > SelectQC Observable
  final dropSelectQ2 = 'Oğuz KABA'.obs; //IsoSpool Info > SelectQC Observable

  final dropSelectT1 = 'E-050'.obs; //FitupEntry > SelectTeam Observable
  final dropSelectT2 = 'E-050'.obs; //WeldEntry > SelectTeam Observable

  final selectHeat = true.obs; //FitupEntry > SelectHeat Observable
  final selectWelderR1 = false.obs; //WeldEntry > SelectWelder Root-1 Observable
  final selectWelderR2 = false.obs; //WeldEntry > SelectWelder Root-1 Observable
  final selectWelderC1 = false.obs; //WeldEntry > SelectWelder Cap-1 Observable
  final selectWelderC2 = false.obs; //WeldEntry > SelectWelder Cap-2 Observable

  final selectWPS = true.obs; //WeldEntry > SelectWPS Observable
  final wpsData = ''.obs; //WeldEntry > wpsData Observable

  final dragText = ''.obs; //WeldEntry > DragText Observable

  final refreshData = false.obs; //WeldEntry >ListView refresh Observable
}
