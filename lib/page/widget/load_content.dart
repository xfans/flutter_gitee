import 'package:flutter/material.dart';

class LoadContent<T> extends StatelessWidget {
  const LoadContent({Key key, @required future, @required contentBuilder})
      : _future = future,
        builderContent = contentBuilder,
        super(key: key);

  final _future;
  final ContentWidgetBuilder<T> builderContent;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        future: _future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              print('waiting');
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              print('done');
              if (snapshot.hasError) {
                return Center(
                  child: Text('网络请求出错'),
                );
              } else if (snapshot.hasData) {
                return builderContent(snapshot.data);
              } else {
                return Center(
                  child: Text('网络请求出错'),
                );
              }
          }
          return null;
        });
  }
}
typedef ContentWidgetBuilder<T> = Widget Function(T data);
