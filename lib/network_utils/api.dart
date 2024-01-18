// ignore_for_file: non_constant_identifier_names

import 'package:meta_car_wash/constant/app_mode.dart';

class API {
  static const live =
      'https://apiadlisting.templatecookie.com/api'; // Live Production API URL
  static const test =
      'https://apiadlisting.templatecookie.com/api'; // Live Staging API URL
  static const base = AppMode.PRODUCTION_MODE ? live : test;

  // //update profile
  static const updateProfile = '/auth/profile';
  static const changePassword = '/auth/password';
  static const user = '/user';
  static const userBalance = '/user/balance';

  ///// Banner
  static const banner = '/banner';

  ///// auth
  static const signup = '/auth/register'; //clear
  static const login = '/auth/login'; //clear
  static const logout = '/auth/logout';
  static const updatepassword = '/password/update';
  ///// Notification
  static const notification = '/notifications';

  ///// ads post
  static const adsPost = '/ads';

  ///// brand
  static const brands = '/brands';

  ///// overview
  static const overview = '/customer/dashboard-overview';

  ///// category
  static const categories = '/categories'; //clear

  static categoryWiseSubcategory({
    id = "",
  }) =>
      '/categories/$id/subcategories';

  ///// addRemoveFavouriteListing

  static addRemoveFavouriteListing({
    id = "",
  }) =>
      '/ads/$id/favourite';

  static allCategories({
    subcategory = "",
  }) =>
      '/categories?subcategories=$subcategory';
  ///// popular list api
  static popularadsListing({
    filter_by = "",
  }) =>
      '/ads?filter_by=$filter_by';
  ///// multiple category ads listing api
  static multiplecategoryadsListing({queryCategoryString = "", page = ""}) =>
      '/ads?$queryCategoryString';
  static multiplecountryadsListing({queryCountryString = "", page = ""}) =>
      '/ads?$queryCountryString';
  ///// multiple subcategory ads listing api
  static multiplesubcategoryadsListing(
          {queryCategoryString = "", querySubCategoryString = "", page = ""}) =>
      '/ads?$queryCategoryString&$querySubCategoryString';

  /// product list api
  static adsListing(
          {sort_by = "",
          category = "",
          keyword = "",
          condition = "",
          price_min = "",
          price_max = "",
          paginate = "",
          subcategory = "",
          country = "",
          filter_by = "",
          page = ""}) =>
      sort_by != ""
          ? '/ads?sort_by=$sort_by'
          : category != ""
              ? '/ads?category[]=$category'
              : keyword != ""
                  ? '/ads?keyword=$keyword'
                  : condition != ""
                      ? '/ads?condition=$condition'
                      : price_min != ""
                          ? '/ads?price_min=$price_min'
                          : price_max != ""
                              ? '/ads?price_max=$price_max'
                              : paginate != ""
                                  ? '/ads?paginate=$paginate'
                                  : subcategory != ""
                                      ? '/ads?subcategory[]=$subcategory'
                                      : country != ""
                                          ? '/ads?country[]=$country'
                                          : filter_by != ""
                                              ? '/ads?filter_by=$filter_by'
                                              : '/ads';

///// my list api
  static myListing({paginate = "", sort = "", filter = "", page = ""}) =>
      '/customer/ads?filter=$filter&paginate=$paginate&sort=$sort';

  /////single Product Details

  static productDetails({
    slug = "",
  }) =>
      '/ads/$slug';

  ///// recent api

  static const recentPostAds = '/customer/recent-ads';

  /////favrorite api

  static const favouritelist = '/customer/favourite-list';

  ///// recent invoice
  static const recentInvoice = '/customer/recent-invoices';

  ///// delete my listing api
  static deleteMyListing({
    id = "",
  }) =>
      '/customer/ads/$id/delete';

  static const deleteAccount = '/customer/account-delete';
  ///// expire my listing api
  static markExpireMyListing({
    id = "",
  }) =>
      '/customer/ads/$id/expire';

  ///// chat list
  static const chatlist = '/messages';
  ///// selected Message
  static selectedMessageUser({userName = ""}) => '/message/$userName';
///// country list
  static const country = '/countries';
  ///// webview page list
  static const webviewPageList = '/page-list';
}
