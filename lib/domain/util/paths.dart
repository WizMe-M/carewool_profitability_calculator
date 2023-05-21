import 'package:external_path/external_path.dart';

/// Gets downloads path for Android.
/// Creates this folder if it does not exist.
Future<String> getDownloadsPath() async {
  var downloadsPath = await ExternalPath.getExternalStoragePublicDirectory(
    ExternalPath.DIRECTORY_DOWNLOADS,
  );
  return downloadsPath;
}
