import 'package:flutter/material.dart'; //风格1 - 谷歌推出
import 'package:flutter/cupertino.dart'; //风格2 - iOS
import 'package:provider/provider.dart';

import 'pages/Index_page.dart';
import 'pages/provider_page1.dart';
import 'pages/provider_page2.dart';

void main() {
  runApp(MyApp3());
  // testProvider();
  // testProvider2();
}

void testProvider1() {
  // 将模型提供给应用程序中的所有小部件。
// https://github.com/flutter/samples/tree/main/provider_counter
// https://pub.dev/packages/provider

  runApp(ChangeNotifierProvider(
      //在构建器中初始化模型。这样，提供者 可以拥有Counter的生命周期，确保 当不再需要的时候 调用`dispose`
      create: (context) => CounterProvider1(),
      child: const MyApp1()));
}

void testProvider2() {
  // https://ducafecat.medium.com/flutter-最佳实践和编码准则-54d07752c545

  // 在这个例子中，ChangeNotifierProvider 创建了一个CounterModel的实例，并将其提供给 MyApp。
  // 在 MyApp 的子 widget中，可以通过 Provider.of(context) 或 Consumer 来获取计数器模型的实例，并根据模型的状态更新UI。
  runApp(ChangeNotifierProvider(
      create: (context) => CounterProvider2(), child: const MyApp()));
}

// ==================== 1.包含 tabbar 的 APP demo ====================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '百姓生活',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      home: const IndexPage(),
    );
  }
}

// ==================== 2. 使用 Provider 来管理状态 ====================

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'title',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProviderPage1(),
    );
  }
}

// 叠加图片示例 - 垂直居中并保持底部间距
class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取屏幕的高度
    double screenHeight = MediaQuery.of(context).size.height;
    double image1Height = 400; // 第一张图片的高度
    double image2Height = 98;
    double image1bottomMargin =
        screenHeight / 2 - image1Height / 2; // 第一张图片的底部间距
    double image2bottomMargin = image1bottomMargin + image2Height - 20;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('图片叠加示例')),
        body: Center(
          child: Stack(
            alignment: Alignment.center, // 垂直居中
            children: [
              Positioned(
                bottom: image1bottomMargin, // 底部间距
                child: Image.asset(
                  'assets/img_bg@1x.png',
                  height: image1Height, // 第一张图片的高度
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: image2bottomMargin, // 底部间距
                child: Image.asset(
                  'assets/img_code@1x.png',
                  height: image2Height, // 第二张图片的高度
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
