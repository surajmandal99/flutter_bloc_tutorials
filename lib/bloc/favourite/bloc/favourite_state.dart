import 'package:equatable/equatable.dart';

import '../../../model/favourite/favourite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteList;
  final List<FavouriteItemModel> tempFavouriteList;

  final ListStatus listStatus;
  const FavouriteState(
      {this.favouriteList = const [],
      this.listStatus = ListStatus.loading,
      this.tempFavouriteList = const []});

  FavouriteState copyWith(
      {List<FavouriteItemModel>? favouriteList,
      ListStatus? listStatus,
      List<FavouriteItemModel>? tempFavouriteList}) {
    return FavouriteState(
        favouriteList: favouriteList ?? this.favouriteList,
        listStatus: listStatus ?? this.listStatus,
        tempFavouriteList: tempFavouriteList ?? this.tempFavouriteList);
  }

  @override
  List<Object?> get props => [favouriteList, listStatus, tempFavouriteList];
}
