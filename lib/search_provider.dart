
import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchNotifier,SearchState>((ref){
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: ''));
  void search(String quarry){
    state = state.copyWith(search: quarry);
  }
}

class SearchState {
  final String search;

  SearchState({required this.search});

  SearchState copyWith({String? search}){
    return SearchState(search: search ?? this.search);
  }
}