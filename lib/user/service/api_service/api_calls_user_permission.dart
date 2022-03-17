import 'package:permission_handler/permission_handler.dart';

late Permission permission;
PermissionStatus permissionStatus = PermissionStatus.denied;

class PermissionHandler {
  void listenForPermission() async {
    switch (permissionStatus) {
      case PermissionStatus.denied:
        requestForPermission();
        break;
      case PermissionStatus.granted:
        break;

      case PermissionStatus.limited:
        break;
      case PermissionStatus.restricted:
        // ignore: todo
        // TODO: Handle this case.
        break;
      case PermissionStatus.permanentlyDenied:
        // ignore: todo
        // TODO: Handle this case.
        break;
    }
  }
}

Future<void> requestForPermission() async {
  final status = await Permission.location.request();
  permissionStatus = status;
}
