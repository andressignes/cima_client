part of 'theme_app_cubit.dart';

class ThemeAppState extends Equatable {
  const ThemeAppState({required this.themeMode});

  final ThemeMode themeMode;

  ThemeAppState copyWith({ThemeMode? themeMode}) {
    return ThemeAppState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object?> get props => [themeMode];
}
