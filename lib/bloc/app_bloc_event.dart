part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AppEvent {
  @override
  String toString() => 'AppStarted';
}

class AppBrowseEvent extends AppEvent {
  final String id;

  AppBrowseEvent(this.id);

  @override
  String toString() => 'AppBrowse';
}

class ProductSelect extends AppEvent {
  final String id;

  ProductSelect(this.id);

  @override
  String toString() => 'ProductSelect';
}

class BackEvent extends AppEvent {}
