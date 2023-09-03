import 'package:shamo/pages/artikel/model/NBModel.dart';
import 'package:shamo/pages/artikel/utils/NBImages.dart';

List<NBBannerItemModel> nbGetBannerItems() {
  List<NBBannerItemModel> bannerList = [];
  bannerList.add(NBBannerItemModel(image: banner1));
  bannerList.add(NBBannerItemModel(image: banner2));
  bannerList.add(NBBannerItemModel(image: banner3));
  return bannerList;
}
