import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/forum_bloc.dart';
import 'home_page.dart';

class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tempTitle = '';
    String tempContent = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('글 수정'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<ForumBloc, ForumState>(
                    builder: (context, state) {
                      return TextFormField(
                        initialValue: state.articles[state.currentIndex].title,
                        onChanged: (value) {
                          tempTitle = value;
                        },
                        decoration: InputDecoration(
                          labelText: '제목',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding:
                          const EdgeInsets.only(left: 7.0, top: 3.0),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: BlocBuilder<ForumBloc, ForumState>(
                        builder: (context, state) {
                          return TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            initialValue:
                            state.articles[state.currentIndex].content,
                            onChanged: (value) {
                              tempContent = value;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.only(left: 7.0, top: 3.0),
                              border: InputBorder.none,
                              hintText: '내용',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      int flagSum = 0;
                      if (tempTitle.length < 2) {
                        flagSum++;
                      }

                      if (tempContent.length < 5) {
                        flagSum += 2;
                      }

                      switch (flagSum) {
                        case 1:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content: Text('제목을 두 글자 이상 입력하세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                            break;
                          }
                        case 2:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content: Text('내용을 다섯 글자 이상 입력하세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                            break;
                          }
                        case 3:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content:
                                  Text('제목을 두 글자 이상,\n내용을 다섯 글자 이상 입력하세요.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                            break;
                          }
                        default:
                          {
                            showDialog(
                              context: context,
                              builder: (context) {
                                flagSum = 0;
                                return AlertDialog(
                                  content: Text('수정하시겠습니까?'),
                                  actions: [
                                    BlocBuilder<ForumBloc, ForumState>(
                                      builder: (context, state) {
                                        return TextButton(
                                          onPressed: () {
                                            String tempTime =
                                            DateFormat('yyyy-MM-dd HH:mm')
                                                .format(DateTime.now());
                                            context.read<ForumBloc>().add(
                                                EditTitleEvent(
                                                    index: state.currentIndex,
                                                    title: tempTitle));
                                            context.read<ForumBloc>().add(
                                                EditContentEvent(
                                                    index: state.currentIndex,
                                                    content: tempContent));
                                            context.read<ForumBloc>().add(
                                                ToggleIsEditedEvent(
                                                    index: state.currentIndex));
                                            context.read<ForumBloc>().add(
                                                SetEditedAtEvent(
                                                    index: state.currentIndex));

                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()),
                                                    (route) => false);
                                          },
                                          child: Text('확인'),
                                        );
                                      },
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('취소'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50.0,
                      color: Colors.blue,
                      child: Text(
                        '완료',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
