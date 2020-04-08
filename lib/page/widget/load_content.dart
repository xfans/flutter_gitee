import 'package:flutter/material.dart';

class LoadContent<T> extends StatelessWidget {
  const LoadContent({Key key, this.future, @required this.contentBuilder})
      : assert(contentBuilder != null),
        super(key: key);

  final Future<T> future;
  final ContentWidgetBuilder<T> contentBuilder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text('暂无数据'));
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text('网络请求出错'),
                );
              } else if (snapshot.hasData) {
                return contentBuilder(snapshot.data);
              } else {
                return Center(
                  child: Text('暂无数据'),
                );
              }
          }
          return Center(
            child: Text('暂无数据'),
          );
        });
  }
}

typedef ContentWidgetBuilder<T> = Widget Function(T data);
