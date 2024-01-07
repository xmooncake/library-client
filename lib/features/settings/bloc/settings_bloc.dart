import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsAccountInformationEvent>((event, emit) {});
    on<SettingsAddressInformationEvent>((event, emit) {});
    on<SettingsChangePasswordEvent>((event, emit) {});
  }
}
