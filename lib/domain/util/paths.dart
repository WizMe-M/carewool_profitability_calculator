import 'package:external_path/external_path.dart';

/// Gets downloads path for Android.
/// Creates this folder if it does not exist.
Future<String> getDownloadsPath() {
  return ExternalPath.getExternalStoragePublicDirectory(
    ExternalPath.DIRECTORY_DOWNLOADS,
  );
}
