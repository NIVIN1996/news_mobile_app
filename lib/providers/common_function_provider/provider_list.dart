import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../news_list_provider/news_list_provider.dart';
import '../sample_provider.dart';

class ProviderRegistrar {
  static List<SingleChildWidget> providers = [
    // ChangeNotifierProvider(create: (_) => MovieProvider()),
    ChangeNotifierProvider(create: (_) => ArticleListProvider()),
  ];
}
