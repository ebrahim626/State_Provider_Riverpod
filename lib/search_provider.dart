
import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchNotifier,SearchState>((ref){
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', isChange: false));
  void search(String quarry){
    state = state.copyWith(search: quarry);
  }
  void onChange(bool onChange){
    state = state.copyWith(isChange: onChange);
  }
}

class SearchState {
  final String search;
  final bool isChange;

  SearchState({required this.search,required this.isChange});

  SearchState copyWith({String? search, bool? isChange}){
    return SearchState(search: search ?? this.search, isChange: isChange ?? this.isChange);
  }
}