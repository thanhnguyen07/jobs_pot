import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_state_entity.freezed.dart';

@freezed
class AppStateEntity with _$AppStateEntity {
  const factory AppStateEntity({required String message}) = _AppStateEntity;
}
