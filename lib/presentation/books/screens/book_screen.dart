import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mugalim/presentation/books/screens/selectBook/select_jenre.dart';

import '../../../core/routes/routes_const.dart';
import '../../../logic/book/bloc/book_bloc.dart';
import 'bookMain/main_book_screen.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  bool isTrue = false;
  List selectList = ['Бизнес', 'Классика', 'Развитие', 'Фантастика'];
  @override
  Widget build(BuildContext context) {
    BlocBuilder<BookBloc,BookState>(
      builder: (context, state) {
        if(state is BookSemesterDeadlineSuccess){
          DateTime createdAt = DateTime.parse(state.list.createdAt!);
          String createdAtDate = DateFormat('d MMM в hh:mm').format(createdAt);
          String nowDate = DateFormat('d MMM в hh:mm').format(DateTime.now());
          DateTime endAt = DateTime.parse(state.list.endDate!);
          String endAtDate = DateFormat('d MMM в hh:mm').format(endAt);
          bool isFalse = true;
          if(double.parse(nowDate) > double.parse(createdAtDate) && double.parse(nowDate) < double.parse(endAtDate)) {
            isTrue = true;
          }

        }
        return const Offstage();
      },
    );
    return Scaffold(
      body: isTrue ? const BookScreen() : GenreScreen(indexMonth: 0, list: selectList)
    );
  }
}
