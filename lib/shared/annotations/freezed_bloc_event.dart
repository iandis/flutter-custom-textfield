import 'package:freezed_annotation/freezed_annotation.dart';

const Freezed freezedBlocEvent = Freezed(
  copyWith: false,
  equal: false,
  makeCollectionsUnmodifiable: true,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
);
