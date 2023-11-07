import 'package:authentic_guards/data/repository/remote/scanner_repository.dart';
import 'package:authentic_guards/domain/model/params/check_code_params.dart';
import 'package:authentic_guards/domain/model/params/claim_params.dart';
import 'package:authentic_guards/helper/ui_helpers.dart';
import 'package:authentic_guards/pages/scanner/scanner_claim_success.dart';
import 'package:authentic_guards/pages/scanner/scanner_proccess_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ScannerController extends GetxController {
  final ScannerRepositoryImpl scanner;
  ScannerController({required this.scanner});

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  final _resultMap = <String, dynamic>{}.obs;
  get resultMap => _resultMap.value;

  final _resultClaim =  <String, dynamic>{}.obs;
  get resultClaim => _resultClaim.value;

  final _isLogin = false.obs;
  get isLogin => _isLogin.value;

  final _hasError = false.obs;
  get hasError => _hasError.value;

  void loginCheck() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user?.email != null) {
        _isLogin.value = true;
      } else {
        _isLogin.value = false;
      }
    });
  }

  Future<void> doScan({String code = ""}) async {
    _isLoading.value = true;
    _hasError.value = false;
    try {

      if(code.isEmpty) {
        return;
      }

      await Geolocator.checkPermission();
      final geolocation = await Geolocator.getCurrentPosition();

      final params = CheckCodeParams(
          code: code,
          latitude: "${geolocation.latitude}",
          longitude: "${geolocation.longitude}"
      );
      _resultMap.value = await scanner.checkCode(params);

      final response = (resultMap as Map<String,dynamic>);

      // if(response['status'] == 1 || response['status'] == 11) {
      //   notFound(Get.context!);
      //   return;
      // }

      _isLoading.value = false;
    } catch(e) {
      _hasError.value = true;
      _isLoading.value = false;
      UiHelpers.showSnackBar(Get.context!, snackBarMode: SnackBarMode.ERROR, content: "${e}");
    }
  }

  Future<void> doClaim({String pin = ""}) async {
    try {

      if(pin.isEmpty) {
        return;
      }

      UiHelpers.showLoading(Get.context!,message: "sedang melakukan claim");

      await Geolocator.checkPermission();
      final geolocation = await Geolocator.getCurrentPosition();

      final product = resultMap as Map<String,dynamic>;

      final params = ClaimParams(
          pin: pin,
          code_claim: CodeClaim(
            value: product['code_claim']['value'],
            key: product['code_claim']['key'],
          ),
          latitude: "${geolocation.latitude}",
          longitude: "${geolocation.longitude}"
      );
      final response = await scanner.claim(params);
      Get.back();

      _resultClaim.value = response;

      if(response['status'] == 11) {
        Get.off(ScannerProccessResult(state: ScannerResultBack.PRODUCT));
        return;
      }

      Get.off(ScannerClaimSucess());

    } catch(e) {
      Get.back();
      UiHelpers.showSnackBar(Get.context!, snackBarMode: SnackBarMode.ERROR, content: "${e}");
    }
  }
}