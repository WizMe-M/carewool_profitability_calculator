import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

// TODO: remove in case of Isar usage
class ApplicationDatabase {
  static const String dbFileName = 'carewool.db';

  final products = intMapStoreFactory.store('products');

  late Database client;

  Future<ApplicationDatabase> init() async {
    final applicationDirectory = await getApplicationDocumentsDirectory();
    final path = join(applicationDirectory.path, dbFileName);
    client = await databaseFactoryIo.openDatabase(path);
    return this;
  }
}
