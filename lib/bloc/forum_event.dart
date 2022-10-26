part of 'forum_bloc.dart';

abstract class ForumEvent extends Equatable {
  const ForumEvent();

  @override
  List<Object> get props => [];
}

class AddArticleEvent extends ForumEvent {
  final Article article;
  AddArticleEvent({required this.article});
}

class DeleteArticleEvent extends ForumEvent {
  final int index;
  DeleteArticleEvent({required this.index});
}

class ChangeCurrentIndexEvent extends ForumEvent {
  final int index;
  ChangeCurrentIndexEvent({required this.index});
}

class EditTitleEvent extends ForumEvent {
  final int index;
  final String title;
  EditTitleEvent({required this.index, required this.title});
}

class EditContentEvent extends ForumEvent {
  final int index;
  final String content;
  EditContentEvent({required this.index, required this.content});
}

class ToggleIsEditedEvent extends ForumEvent {
  final int index;
  ToggleIsEditedEvent({required this.index});
}

class SetEditedAtEvent extends ForumEvent {
  final int index;
  SetEditedAtEvent({required this.index});
}