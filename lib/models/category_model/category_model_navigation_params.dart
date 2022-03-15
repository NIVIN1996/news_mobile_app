import '../../utils/static/enums.dart';
import '../top_news_headline_model/top_news_headline_model.dart';

class CategoryNewsNavigationParameters {
  String category;
  TopHeadlineNewsModel? categoryListModel;
  ApiStatus categoryNewsStatus;
  String errorStatus;
  Function callBack;
  CategoryNewsNavigationParameters(
      {required this.category,
      required this.categoryListModel,
      required this.categoryNewsStatus,
      required this.errorStatus,
      required this.callBack});
}
