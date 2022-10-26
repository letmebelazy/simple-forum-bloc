import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import '../models/article.dart';

part 'forum_event.dart';
part 'forum_state.dart';

class ForumBloc extends Bloc<ForumEvent, ForumState> {
  ForumBloc() : super(ForumState.initial()) {
    on<AddArticleEvent>((event, emit) {
      List<Article> tempList = state.articles;
      tempList.add(event.article);
      emit(state.copyWith(articles: tempList));
    });

    on<DeleteArticleEvent>((event, emit) {
      List<Article> tempList = state.articles;
      tempList.removeAt(event.index);
      emit(state.copyWith(articles: tempList));
    });

    on<ChangeCurrentIndexEvent>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<EditTitleEvent>((event, emit) {
      List<Article> tempList = state.articles;
      tempList[event.index].title = event.title;
      emit(state.copyWith(articles: tempList));
    });

    on<EditContentEvent>((event, emit) {
      List<Article> tempList = state.articles;
      tempList[event.index].content = event.content;
      emit(state.copyWith(articles: tempList));
    });

    on<ToggleIsEditedEvent>((event, emit) {
      List<Article> tempList = state.articles;
      tempList[event.index].isEdited = true;
      emit(state.copyWith(articles: tempList));
    });

    on<SetEditedAtEvent>((event, emit) {
      List<Article> tempList = state.articles;
      tempList[event.index].editedAt = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
      emit(state.copyWith(articles: tempList));
    });
  }
}
