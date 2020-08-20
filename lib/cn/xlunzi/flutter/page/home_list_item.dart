import 'package:flutter/material.dart';
import 'package:flutter_app/cn/xlunzi/flutter/bean/article_entity.dart';

class HomeListItem extends StatefulWidget {
  final ItemData _itemData;

  HomeListItem(this._itemData);

  @override
  _HomeListItemState createState() => _HomeListItemState(_itemData);
}

class _HomeListItemState extends State<HomeListItem> {
  final ItemData _itemData;

  _HomeListItemState(this._itemData);

  @override
  Widget build(BuildContext context) {
    Row _author = Row(
      children: [
        Expanded(
            child: Text.rich(TextSpan(children: [
          TextSpan(text: '作者：'),
          TextSpan(
            text: _itemData.author,
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ]))),
        Text(_itemData.niceDate)
      ],
    );

    Text _title = Text(
      _itemData.title,
      style: TextStyle(fontSize: 16, color: Colors.black),
      textAlign: TextAlign.left,
    );

    Text _chapterName = Text(
      _itemData.chapterName,
      style: TextStyle(color: Theme.of(context).primaryColor),
    );

    Column _column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: _author,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: _title,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: _chapterName,
        )
      ],
    );

    return Card(
      elevation: 4.0,
      child: _column,
    );
  }
}
