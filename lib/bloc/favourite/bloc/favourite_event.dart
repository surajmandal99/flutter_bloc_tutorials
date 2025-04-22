// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../model/favourite/favourite_item_model.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class FavouriteItem extends FavouriteEvent {
  FavouriteItemModel item;
  FavouriteItem({required this.item});
}

class SelectItem extends FavouriteEvent {
  FavouriteItemModel item;
  SelectItem({required this.item});
}

class UnSelectItem extends FavouriteEvent {
  FavouriteItemModel item;
  UnSelectItem({required this.item});
}

class DeleteItem extends FavouriteEvent {}
